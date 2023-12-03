import React from 'react';
import LinearProgress from '@mui/material/LinearProgress';
import Typography from '@mui/material/Typography';
import { color } from '@mui/system';

const CustomLinearProgress = ({ labelLeft, labelRight, value, colorLeft, colorRight }) => {
  return (
    <div style={{ display: 'flex', alignItems: 'center' }}>
      <Typography variant="body2" color="textSecondary" style={{ marginRight: '8px' }}>
        {labelLeft}
      </Typography>
      <Typography variant="body2" color="textSecondary" style={{ marginRight: '4px' }}>
        {100-value}%
      </Typography>
      <LinearProgress
        variant="determinate"
        value={value}
        sx={{
          width: '100%',
          height: '10px',
          borderRadius: '5px',
          marginBottom: '8px',
          backgroundColor: colorRight}}
          color='secondary'
      />
      <Typography variant="body2" color="textSecondary" style={{ marginLeft: '8px' }}>
        {labelRight}
      </Typography>
      <Typography variant="body2" color="textSecondary" style={{ marginLeft: '4px' }}>
        {value}%
      </Typography>
    </div>
  );
};


export default CustomLinearProgress;
