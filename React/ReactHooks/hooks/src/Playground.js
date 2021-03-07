import React, { useState, useEffect, useRef, useCallback } from "react";

const randomColor = [
  "#fbe831",
  "#e32c85",
  "#ee3ed2",
  "#33754c",
  "#636f83",
  "#a6b51d",
  "#91e266",
  "#74727f",
  "#7055e1",
  "#c990b4",
];

export default function Playground() {
  const [count, setCount] = useState(0);

  const [color, setColor] = useState(null);
  useEffect(() => {
    setColor(randomColor[Math.floor(Math.random() * randomColor.length)]);
    inputRef.current.focus();
  }, [count]); // dependences which trigger effect

  const inputRef = useRef();

  // const calculate = useCallback(<Calculate />, [count]);
  const callback = useCallback((num) => console.log(num), [count]);

  return (
    <div style={{ borderTop: `10px solid ${color}` }}>
      {count}
      <button onClick={() => setCount((currentCount) => currentCount - 1)}>
        -
      </button>
      <button onClick={() => setCount((currentCount) => currentCount + 1)}>
        +
      </button>
      <hr />

      <input
        ref={inputRef}
        type="range"
        onChange={(event) => setCount(event.target.value)}
        value={count}
      />
      {/* {calculate} */}
      <Calculate callback={callback} num={count} />
    </div>
  );
}

function Calculate({ callback }) {
  callback();
  const renderCount = useRef(1);
  return <div>{renderCount.current++}</div>;
}
