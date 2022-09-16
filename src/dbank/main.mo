import Debug "mo:base/Debug"

actor DBank {
  var currentValue: Nat = 300;
  currentValue := 100;

  //Constant
  let id = 3234343434234;


  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount to large, currentValue less than zero")
    }
  };

  public query func checkBalace(): async Nat {
    return currentValue;
  };


  
};
