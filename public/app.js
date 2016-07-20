function something() {
  var y = window.localStorage.getItem('bbb');
  y = y * 1 + 1; // x = x+1
  window.localStorage.setItem('bbb', y);
  alert(y);
}

function add_to_cart(id) {
  var key = 'product_' + id
  var x = window.localStorage.getItem(key);
  x = x * 1 + 1;
  window.localStorage.setItem(key, x);
 // alert('Added ' + (cart_get_number_of_items()) + ' pizza(s) in your cart' );
  update_orders_input();
  update_orders_button();
}


function cart_get_number_of_items()
{
  var cnt = 0;
  for (var i = 0; i < window.localStorage.length; i++) {
    var key = window.localStorage.key(i); // получаем ключ
    var value = window.localStorage.getItem(key); // получаем значение, аналог в ruby hh[key] = x
    if (key.indexOf('product_') == 0)
    {
      // cnt++;
      cnt = cnt + value*1;
    }
  }
  return cnt;
}

function update_orders_input()
{
  var orders = cart_get_orders();
  $('#orders_input').val(orders);

}

function update_orders_button()
{
  var text = 'Cart('+ cart_get_number_of_items() + ')';
  $('#button_items').val(text);
}

function cart_get_orders()
{
  var orders = '';
  for (var i = 0; i < window.localStorage.length; i++) {
    var key = window.localStorage.key(i); // получаем ключ
    var value = window.localStorage.getItem(key); // получаем значение, аналог в ruby hh[key] = x
    if (key.indexOf('product_') == 0)
    {
      // cnt++;
      orders = orders + key + '= '+ value+ '; ';
    }
  }
  return orders;
}



//   window.localStorage.key(0);
//   var key = window.localStorage.key(0);
//   var value =  window.localStorage.getItem(key)
//   key.indexOf('product_')


//var sum = 0;
//for (var i = 0; i < localStorage.length; i++) {
//  var key = localStorage.key(i);
//  sum += Number(localStorage[key]);
//}
//
// console.log(sum);
//

