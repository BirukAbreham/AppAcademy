import React, { useState, useEffect } from "react";
import Name from "./Name";
import ColorPicker from "./ColorPicker";

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
  const getColors = () => {
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
  };
  useEffect(getColors, []);
  return (
    <header style={{ borderTop: `10px solid ${activeColor}` }}>
      <div className="app">
        <Name />
      </div>
      <div style={{ marginTop: 10 }}>
        <ColorPicker
          colors={colors}
          activeColor={activeColor}
          setActiveColor={setActiveColor}
        />
      </div>
    </header>
  );
}
