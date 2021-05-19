//src/pages/Todo.res
/* 
Records are like JavaScript objects but:
  are immutable by default
  have fixed fields (not extensible)
*/
type todo = {id: int, text: string }

@react.component
let make = () => {
  let title = "Hello Todo List !";
  
  let (todoInput, setTodoInput) = React.useState(_ => "");

  let (todos, setTodos) = React.useState(_ => [
    { id: Js.Math.random_int(0, 999), text: "Todo 1"}
  ]);


  let onChange = (value) => {
      setTodoInput(_prev => value);
  }

  let onSave = (evt) => {
      ReactEvent.Mouse.preventDefault(evt)
      let newTodo = {id: Js.Math.random_int(0, 999), text: todoInput};
      let newTodoList = Js.Array.concat(todos, [newTodo])
      setTodos(_prev => newTodoList );
  }

  let onFilter = (evt, id) => {
    ReactEvent.Mouse.preventDefault(evt);
    let res = todos->Js.Array2.filter(x => x.id !== id);
    setTodos(_prev => res );
  }

  <div>
    {React.string(title)}
    <TodoInput todoText=todoInput handleChange=onChange />
    <button onClick=onSave >{React.string("save")}</button>

    {
      
      Belt.Array.map(todos, (todo) => {
        <div key={Belt.Int.toString(todo.id)}>
          <button onClick={(evt) => onFilter(evt, todo.id)} >{React.string("X")}</button>
          {React.string(" -- ")}
          {React.string(todo.text)}
        </div>
      })->React.array
    }
  </div>
}
