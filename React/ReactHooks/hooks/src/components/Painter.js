import React, { useState, useEffect, useRef, useCallback } from "react";
import Name from "./Name";
import ColorPicker from "./ColorPicker";
import useWindowSize from "./WindowSize";
import Canvas from "./Canvas";
import RefreshButton from "./RefreshButton";

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

export default function Paint() {
  const [colors, setColors] = useState([]);
  const [activeColor, setActiveColor] = useState(null);

  const getColors = useCallback(() => {
    const baseColor =
      randomColor[Math.floor(Math.random() * randomColor.length)];

    fetch(
      `https://www.thecolorapi.com/scheme?hex=${baseColor.slice(
        1
      )}&mode=triad&count=6`
    )
      .then((res) => res.json())
      .then((res) => {
        setColors(res.colors.map((color) => color.hex.value));
        setActiveColor(res.colors[0].hex.value);
      });
  }, []);

  useEffect(getColors, []);

  const [visible, setVisible] = useState(false);
  let timeoutId = useRef();
  const [windowWidth, windowHeight] = useWindowSize(() => {
    setVisible(true);
    clearTimeout(timeoutId);
    timeoutId.current = setTimeout(() => setVisible(false), 500);
  });

  const headerRef = useRef({ offsetHeight: 0 });

  return (
    <div className="app">
      <header
        style={{ borderTop: `10px solid ${activeColor}` }}
        ref={headerRef}
      >
        <div className="app">
          <Name />
        </div>
        <div style={{ marginTop: 10 }}>
          <ColorPicker
            colors={colors}
            activeColor={activeColor}
            setActiveColor={setActiveColor}
          />
          <RefreshButton callback={getColors} />
        </div>
      </header>
      {activeColor && (
        <Canvas
          color={activeColor}
          height={window.innerHeight - headerRef.current.offsetHeight}
        />
      )}
      <div className={`window-size ${visible ? "" : "hidden"}`}>
        {windowWidth} X {windowHeight}
      </div>
    </div>
  );
}
