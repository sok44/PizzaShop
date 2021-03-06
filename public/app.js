

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
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	
	x = x * 1 + 1;

	window.localStorage.setItem(key, x);

	update_orders_input();
	update_orders_button();
}

function update_orders_input()
{
	var orders = cart_get_orders();
	
	//Обращаемся к элементу формы по id (# - символ означет что обращается по id)
	//Синтаксис jQuery
	$('#orders_input').val(orders);
}

function update_orders_button()
{
	var text = 'Cart (' + cart_get_number_of_items() + ')';
	$('#orders_button').val(text);
}

function cart_get_number_of_items()
{
	var cnt = 0;
	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);

		if (key.indexOf('product_') == 0)
		{
			var value = window.localStorage.getItem(key);
			cnt = cnt + value * 1;
		}
	}

	return cnt;
}

function cart_get_orders()
{
	var orders = '';
	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);

		if (key.indexOf('product_') == 0)
		{
			var value = window.localStorage.getItem(key);
			orders = orders + key + '=' + value + ', ';
		}
	}

	return orders;
}

//Функция которая блокирует отправку формы на сервер
function cancel_order()
{
	window.localStorage.clear();
				
	update_orders_input();
	update_orders_button();

	//блок div с id=cart заменяем на текст
	$('#cart').text('Your cart is now empty');

	return false;
}