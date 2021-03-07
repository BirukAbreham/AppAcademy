import React, { useState } from "react";

export default function Name() {
  const [name, setName] = useState("");

  return (
    <label className="header-name">
      <input
        value={name}
        onChange={(event) => setName(event.target.value)}
        onClick={(event) =>
          event.target.setSelectionRange(0, event.target.value.length)
        }
        placeholder="Untitled"
      />
    </label>
  );
}
