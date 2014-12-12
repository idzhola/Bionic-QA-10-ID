function Main()
{
  try
  {
    // Enter your code here. 
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}


function Open()
{
  TestedApps.Orders.Run();
}


function NewOrder()
{
  var  orders;
  var  orderForm;
  var  groupBox;
  var  textBox;
  var  dateTimePicker;
  orders = Aliases.Orders;
  orderForm = orders.OrderForm;
  groupBox = orderForm.Group;
  
  //заполняем форму данными из файла-хранилища 
  
  Driver = DDT.CSVDriver(Project.Path + "\\Stores\\CSV Storage.txt");
  while(!Driver.EOF())
  {
    orders.MainForm.MainMenu.Click("Orders|New order..."); 
    groupBox.ProductNames.ClickItem(Driver.Value(1));
    groupBox.Quantity.wValue = Driver.Value(2); 
    groupBox.Price.WndCaption = Driver.Value(11);
    groupBox.Discount.WndCaption = Driver.Value(12);
    dateTimePicker = groupBox.Date;
    dateTimePicker.wDate = Driver.Value(3);
    groupBox.Customer.wText = Driver.Value(0);
    textBox = groupBox.Street;
    textBox.wText = Driver.Value(4);
    textBox = groupBox.City;
    textBox.wText = Driver.Value(5);
    textBox = groupBox.State;
    textBox.wText = Driver.Value(6);
    textBox = groupBox.Zip;
    textBox.wText = Driver.Value(7);
    groupBox.WinFormsObject(Driver.Value(8)).ClickButton();
    textBox = groupBox.CardNo;
    textBox.wText = Driver.Value(9);
    groupBox.ExpDate.wDate = Driver.Value(10);
    
    //чекпойнт
    aqObject.CompareProperty(groupBox.Customer.wText, cmpEqual, Driver.Value(0), false);
    orderForm.ButtonOK.ClickButton();
    Driver.Next();
  }
}


function Close()
{
  Aliases.Orders.MainForm.Close();
}
