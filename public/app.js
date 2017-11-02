function something()
{
	//Используем технологию Html5 localstorage

	var x = window.localStorage.getItem('bbb');
	//x * 1 - преобразует строку в число, фича
	x = x * 1 + 1;

	window.localStorage.setItem('bbb', x);

	alert(x);

}


function add_to_cart(id)
{
	alert('You added pizza with id:' + id);
}