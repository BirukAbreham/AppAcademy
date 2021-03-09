import React from "react";

const RefreshButton = React.memo(({ callback }) => {
  return (
    <button className="button-refresh-colors" onClick={callback}>
      &#8634;
    </button>
  );
});

export default RefreshButton;
