import Debug "mo:base/Debug"

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  //Constant
  let id = 3234343434234;


  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  
};
