import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // := could overwirte the stable variable. should be comment out
  // To set initial value, remove comment here
  // currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  // To set initial value, remove comment here
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  //Constant
  let id = 3234343434234;


  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount to large, currentValue less than zero")
    }
  };

  public query func checkBalace(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
  
};
