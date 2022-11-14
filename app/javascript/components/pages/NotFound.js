import React, { Component } from "react";


class NotFound extends Component {
  render() {
    return (
    <>
      <div className="notfound">
        <img
          className="notfound-image"
          src="/desert2.jpeg"
          alt="notfound"
          width={"100%"}
          height={"650px"}
        >
        </img>
        <div className="centered">
          <h3>404</h3> 
          <p>Oops, your destination is out of this world...</p>
        </div>
      </div>
    </>
    )
  }
}

export default NotFound;
