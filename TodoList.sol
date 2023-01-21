// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract TodoList {
    struct Todo {
        string text; // Todo's text
        bool completed; // Todo's completion status
    }

    Todo[] public todos; // an array that stores all the Todo items

    /**
     * create a new Todo item
     * @param _text : the text of the Todo
     */
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }
        
    /**
     * update the text of a specific Todo
     * @param _index : the index of the Todo
     * @param _text : the text to be updated
     */
    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    /**
     * get the text and completion status of a specific Todo
     * @param _index : the index of the Todo
     * @returns : the text and completion status of the Todo
     */
    function get(uint _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }
    /**
     * toggles the completion status of a specific Todo
     * @param _index : the index of the Todo
