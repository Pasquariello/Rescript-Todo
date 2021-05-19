//src/components/TodoInput.res
@react.component
let make = (~todoText: string, ~handleChange) => {

 let onChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    handleChange(value);
  }

  <div>
    <input onChange value=todoText />
  </div>
}