import React from 'react';

export default ({ giphy }) => {
  return(
    <li className="giphy-li">
      <img srs={giphy.images.fixed_height.url} />
    </li>
  );
};
