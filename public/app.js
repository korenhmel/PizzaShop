function something()
{
  var y = window.localStorage.getItem('bbb');
  y = y*1+1; // x = x+1
  window.localStorage.setItem('bbb', y);
  alert(y);
}

function add_to_cart(id)
{
  var key = 'product_'+ id
  var x = window.localStorage.getItem( key);
  x = x*1+1;
  window.localStorage.setItem(key, x);
  alert(x);
  }
