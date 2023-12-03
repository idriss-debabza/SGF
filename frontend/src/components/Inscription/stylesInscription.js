// styles.js

import { styled } from "@mui/material";
import { Paper, Avatar, Button } from "@mui/material";

export const StyledPaper = styled(Paper)({
  display: "flex",
  flexDirection: "column",
  alignItems: "center",
  padding: "20px",
  marginTop: "50px",
});

export const StyledAvatar = styled(Avatar)({
  margin: "8px",
  backgroundColor: "#1976D2",
});

export const StyledForm = styled("form")({
  width: "100%",
  marginTop: "8px",
});

export const StyledSubmit = styled(Button)({
  margin: "24px 0 16px",
});
