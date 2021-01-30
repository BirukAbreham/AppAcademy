import React from "react";

const Mailbox = ({ unreadMessages }) => {
  return (
    <div>
      {unreadMessages.length > 0 && (
        <h3>You have {unreadMessages.length} unread messages.</h3>
      )}
    </div>
  );
};

export default Mailbox;
