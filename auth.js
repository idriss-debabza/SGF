import { omk } from "./omk.js";
import { Octokit, App } from "https://esm.sh/octokit";

export class auth {
  constructor(params) {
    var me = this;
    this.apiOmk = params.apiOmk ? params.apiOmk : false;
    this.mail = params.mail ? params.mail : false;
    this.ident = params.ident ? params.ident : false;
    this.key = params.key ? params.key : false;
    this.omk = false;
    this.userAdmin = false;
    this.user = false;

    this.init = function () {
      //création des éléments html
      let htmlNavBar = `<div class="btn-group">
                    <div class="mt-2">User : <span id="userLogin">Anonymous</span></div>                                        
                    <button id="btnAddUser" style="visibility:hidden;" title="Add user" class="btn btn-outline-danger" ><i class="fa-solid fa-user-plus"></i></button>
                    <button id="btnLogin" title="Connexion" class="btn btn-outline-success" >${iconIn}</button>
                                                                
                </div>`;
      me.navbar
        .append("li")
        .attr("class", "nav-item ms-2 me-1")
        .html(htmlNavBar);

      me.m = d3
        .select("body")
        .append("div")
        .attr("id", "modalAuth")
        .attr("class", "modal")
        .attr("tabindex", -1);
      me.m.html(htmlModal);
      me.modal = new bootstrap.Modal("#modalAuth");
      alertAuth = new bootstrap.Collapse("#alertAuth", { toggle: false });
      alertMail = new bootstrap.Collapse("#alertMail", { toggle: false });
      alertServer = new bootstrap.Collapse("#alertServer", { toggle: false });
      alertUnknown = new bootstrap.Collapse("#alertUnknown", { toggle: false });
      alertGitHub = new bootstrap.Collapse("#alertGitHub", { toggle: false });
      alertAuth.hide();
      alertMail.hide();
      alertServer.hide();
      alertUnknown.hide();
      alertGitHub.hide();
      //gestion des événements
      me.m.selectAll("input").on("change", (e) => {
        alertAuth.hide();
        alertMail.hide();
        alertServer.hide();
        alertUnknown.hide();
        alertGitHub.hide();
        me.mail = "";
        me.ident = "";
        me.key = "";
        me.apiOmk = "";
        me.user = false;
        me.keyGitHub = "";
      });
      nameLogin = me.navbar.select("#userLogin");
      btnLogin = me.navbar.select("#btnLogin");
      btnLogin.on("click", (e) => {
        if (btnLogin.attr("class") == "btn btn-outline-success")
          me.modal.show();
        else {
          me.mail = "";
          me.ident = "";
          me.key = "";
          me.apiOmk = "";
          me.user = false;
          me.keyGitHub = "";
          nameLogin.html("Anonymous");
          btnLogin.attr("class", "btn btn-outline-success");
        }
      });
      me.m.select("#btnCheck").on("click", (e) => {
        me.getUser(null);
      });
    };
    async function getGitHubAuth() {
      // Compare: https://docs.github.com/en/rest/reference/users#get-the-authenticated-user
      const {
        data: { login },
      } = await me.octo.rest.users.getAuthenticated();
      me.loginGitHub = login;
    }
    this.getUser = function (cb) {
      //vérifie la connexion à OMK
      me.apiOmk = me.apiOmk
        ? me.apiOmk
        : me.m.select("#authServer").node().value;
      if (me.apiOmk) me.apiOmk += me.apiOmk.slice(-1) == "/" ? "" : "/";
      me.mail = me.mail ? me.mail : me.m.select("#authMail").node().value;
      me.ident = me.ident ? me.ident : me.m.select("#authIdent").node().value;
      me.key = me.key ? me.key : me.m.select("#authPwd").node().value;
      if (!me.mail || !me.ident || !me.key || !me.apiOmk) {
        if (cb) cb(me.user);
      } else {
        me.omk = new omk({
          api: me.apiOmk,
          key: me.key,
          ident: me.ident,
          mail: me.mail,
        });
        me.omk.getUser((u) => {
          if (!u) {
            alertMail.show();
            me.user = false;
            me.omk = false;
          } else {
            me.user = u;
            me.userAdmin = me.user["o:role"] == "global_admin";
            nameLogin.html(me.user["o:name"]);
            btnLogin.attr("class", "btn btn-danger").html(iconOut);
            me.user.id = me.user["o:id"];
            me.modal.hide();
          }
          authGitHub((uGitHub) => {
            me.user.loginGitHub = uGitHub;
            if (cb) cb(me.user);
          });
        });
      }
    };

    function authGitHub(cb) {
      //vérifie la connexion à GitHub
      me.keyGitHub = me.keyGitHub
        ? me.keyGitHub
        : me.m.select("#authGitHubKey").node().value;
      if (me.keyGitHub) {
        // Create a personal access token at https://github.com/settings/tokens/new?scopes=repo
        me.octo = new Octokit({ auth: me.keyGitHub });
        getGitHubAuth()
          .then((e) => {
            cb(me.loginGitHub);
          })
          .catch((err) => {
            alertGitHub.show();
            me.octo = false;
            (me.loginGitHub = false), console.error(err);
            cb(me.loginGitHub);
          });
      } else {
        alertGitHub.show();
        cb(me.loginGitHub);
      }
    }
    this.init();
  }
}
