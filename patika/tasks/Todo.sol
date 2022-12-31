//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract Todo {
    //burada yapılacaklar listesindeki görevler için bir şekil belirliyoruz
    struct TodoStruct {
        string taskText;
        bool status;
    }

    //Yukarıda belirlediğimiz şekle göre bir array oluşturuyoruz
    TodoStruct[] internal todoList;

    //burada arraye görev ekliyoruz. Görevleri eklerken bunu yukarıdaki şekle göre yapıyoruz.
    //Ayrıca görev ilk eklendiğinde statüsü false. Çünkü henüz yapılmadı
    function addTask(string calldata _task) external {
        todoList.push(TodoStruct(_task, false));
    }

    function updateTask(uint index, string calldata _newTask) external {
        todoList[index].taskText = _newTask;
        //ikinci yol:
        //TodoStruct storage task = todoList[index];
        //task.taskText = _newTask;
    }
    //Burada todo görevinin durumu değiştiriyoruz
    function updateStatus(uint index) external {
        todoList[index].status = !todoList[index].status;
    }

    //Burada bütün Todo listemizi görebiliyoruz.
    function getList() external view returns(TodoStruct[] memory) {
        return todoList;
    }
    //Burada istediğimiz todo görevini görebiliyoruz.
    function getTask(uint index) external view returns(TodoStruct memory) {
        return todoList[index];
    }
}