import React from "react";

const ListItem = ({ value }) => <li>{value}</li>;

const NumberList = ({ numbers }) => {
  const listItems = numbers.map((number) => (
    <ListItem key={number.toString()} value={number} />
  ));

  return <ul>{listItems}</ul>;
};

export default NumberList;
