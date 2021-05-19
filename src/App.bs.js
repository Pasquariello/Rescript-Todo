// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Todo from "./pages/Todo.bs.js";
import * as React from "react";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";

function App(Props) {
  var url = RescriptReactRouter.useUrl(undefined, undefined);
  var match = url.path;
  var component;
  var exit = 0;
  if (match) {
    switch (match.hd) {
      case "recipes" :
          var match$1 = match.tl;
          if (match$1) {
            var title = match$1.hd;
            if (title === "add") {
              if (match$1.tl) {
                exit = 1;
              } else {
                component = React.createElement("div", undefined, "Add Recipe");
              }
            } else if (match$1.tl) {
              exit = 1;
            } else {
              component = React.createElement("div", undefined, "View Recipe " + title);
            }
          } else {
            exit = 1;
          }
          break;
      case "tags" :
          if (match.tl) {
            exit = 1;
          } else {
            component = React.createElement("div", undefined, "All tags");
          }
          break;
      case "todo" :
          if (match.tl) {
            exit = 1;
          } else {
            component = React.createElement("div", undefined, React.createElement(Todo.make, {}));
          }
          break;
      default:
        exit = 1;
    }
  } else {
    component = React.createElement("div", undefined, "Home page");
  }
  if (exit === 1) {
    component = React.createElement("div", undefined, "Route not found");
  }
  return React.createElement("div", undefined, component);
}

var make = App;

export {
  make ,
  
}
/* Todo Not a pure module */