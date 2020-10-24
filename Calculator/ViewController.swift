
//  ViewController.swift
//  File Name: Calculator
//  Author's name: Created by Dhrumil Malaviya on 2020-09-29
//  StudentID :301058391
//  App description: A simple mobile calculator UI is built in this version. Additional features like landscape rotation view are added in this module
//  Version 1.3

import UIKit

extension Float
{
    var clean : String
    {
        return String(self).replacingOccurrences(of: ".0*$", with: "", options: .regularExpression)
    }
}
class ViewController: UIViewController
{
        
   var result: Float = 0
    var previousValue : Float = 0
    var currentValue : Float = 0
    var operation=""
    var isPerforming = false
    var value :Float = 0
    var firstOperation = true
    var numberPressedFirstTime=true
    var numberPressedSecondTime=false
    
    
    
    
    // MARK: - UIElements
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblCalculation: UILabel!
    
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnPercentage: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnEquals: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    
    @IBOutlet weak var btnSin: UIButton!
    @IBOutlet weak var btnCos: UIButton!
    @IBOutlet weak var btnTan: UIButton!
    @IBOutlet weak var btnPi: UIButton!
    @IBOutlet weak var btn1x: UIButton!
    
    @IBOutlet weak var btnNo7: UIButton!
    @IBOutlet weak var btnNo8: UIButton!
    @IBOutlet weak var btnNo9: UIButton!
    @IBOutlet weak var btnNo4: UIButton!
    @IBOutlet weak var btnNo5: UIButton!
    @IBOutlet weak var btnNo6: UIButton!
    @IBOutlet weak var btnNo1: UIButton!
    @IBOutlet weak var btnNo2: UIButton!
    @IBOutlet weak var btnNo3: UIButton!
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    
    @IBOutlet var allButtonCollection: [UIButton]!
    @IBOutlet var allViewCollection: [UIView]!
    
// MARK: - Number Clicked Action
    @IBAction func onNumberButtonClicked(_ sender: UIButton)
    {
         switch sender.titleLabel!.text
                {
                    case "C":                               //Clears all the data in the screen and resets the flag in the progra,
                    lblCalculation.text! = "0"
                    lblResult.text!="0"
        
                    case ".":
                    if(!lblCalculation.text!.contains("."))     //limits the user to add only one decimal point
                    {
                        lblCalculation.text! += "."
                        
                    }
                    
                    case "sin":
                        currentValue = Float(lblCalculation.text!)!
                        lblResult.text = String(Float(sin(Double(currentValue))).clean)
        
            
                    case "cos":
                                currentValue = Float(lblCalculation.text!)!
                                lblResult.text = String(Float(cos(Double(currentValue))).clean)
                    
                    case "tan":
                                currentValue = Float(lblCalculation.text!)!
                                lblResult.text = String(Float(tan(Double(currentValue))).clean)
                    case "π":
                            
                        lblResult.text = String(Float((Double.pi)).clean)
                        lblCalculation.text!="π"
                        previousValue=Float(Double.pi)
                        
                    case "1/x":
                        if lblResult.text != nil && lblResult.text != "0"
                        {
                            currentValue = Float(lblResult.text!)!
                            lblCalculation.text!=""
                        }
                        else
                        {
                              currentValue = Float(lblCalculation.text!)!
                        }
                      
                        lblResult.text = String(1/currentValue)
                        
            
            
        
                    default:
                        if(lblCalculation.text=="0") || (isPerforming == true)
                            {
                                lblCalculation.text! = sender.titleLabel!.text!
                                currentValue = Float(lblCalculation.text!)!
                                isPerforming=false
            
                            }
                        else
                            {
                                lblCalculation.text! += sender.titleLabel!.text!
                                currentValue = Float(lblCalculation.text!)!
                            }
                       }

    }
    
// MARK: - Operator Clicked Action
    
    @IBAction func onOperatorButtonPressed(_ sender: UIButton)
    {
       
          switch sender.image(for: UIControl.State.normal)
                {
        
                case UIImage(systemName: "plus.slash.minus"):
                    if lblCalculation.text! != "0"
                    {
                        if(!lblCalculation.text!.contains("-"))
                        {
                            lblCalculation.text!.insert("-", at: lblCalculation.text!.startIndex)
                        }
        
                        else
                        {
                            lblCalculation.text!.remove( at: lblCalculation.text!.startIndex)
                        }
                    }
                case UIImage(systemName: "divide"):
                    previousValue = Float(lblCalculation.text!)!
                    lblCalculation.text = "/"
                    operation="/"
                    isPerforming=true
        
                case UIImage(systemName: "multiply"):
                    previousValue = Float(lblCalculation.text!)!
                    lblCalculation.text = "*"
                    operation="*"
                    isPerforming=true
        
                case UIImage(systemName: "minus"):
                    previousValue = Float(lblCalculation.text!)!
                    lblCalculation.text = "-"
                    operation="-"
                    isPerforming=true
        
                case UIImage(systemName: "plus"):
                    previousValue = Float(lblCalculation.text!)!
                    lblCalculation.text = "+"
                    operation="+"
                    isPerforming=true
                    // lblResult.text! = (previousValue+currentValue).clean
        
                case UIImage(systemName: "percent"):
                    previousValue = Float(lblCalculation.text!)!
                    lblCalculation.text="%"
                    operation="%"
                    isPerforming=true
        
                case UIImage(systemName: "equal"):
                    if operation == "+"
                   {
                    lblResult.text! = (previousValue+currentValue).clean
                    }
        
                    else if operation == "-"
                    {
                        lblResult.text! = (previousValue - currentValue).clean
                    }
        
                    else if operation == "/"
                    {
                        lblResult.text! = (previousValue/currentValue).clean
                    }
        
                    else if operation == "*"
                    {
        
                        lblResult.text! = (previousValue * currentValue).clean
                    }
        
                    else if operation == "%"
                    {
                       // lblResult.text! = String((previousValue*currentValue)*0.01
                        value = (previousValue*currentValue)*0.01
                        lblResult.text! = String(format: "%.8f",value)
                    }
                    
                    else
                    {
                        print("Error")
                    }
                case UIImage (systemName:"delete.left" ):
                    lblCalculation.text!.popLast()
        
                    if lblCalculation.text!.count < 1 || lblResult.text!=="-"
                    {
                        lblCalculation.text! = "0"
                    }
                default:
                    print(Error.Type.self)
                }

    }
    
    
    // MARK: - ViewController Methods
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initViews()
        self.view.backgroundColor=UIColor (red: 55/255, green: 67/255, blue: 83/255, alpha: 1)
        //setting the background color of the safearea
       
    }
    
    // MARK: - Methods
    func initViews()
    {
        for style in allButtonCollection                                                       //using for loops to apply designs to all buttons
        {
            buttonStyle(button: style)
        }
        for item in allViewCollection
        {
            viewStyle(view: item)
        }
        
        //image
        btnPlusMinus.setImage(UIImage(systemName: "plus.slash.minus"), for: .normal)
        btnPercentage.setImage(UIImage(systemName: "percent"), for: .normal)
        btnPlus.setImage(UIImage(systemName: "plus"), for: .normal)
        btnMinus.setImage(UIImage(systemName: "minus"), for: .normal)
        btnDivide.setImage(UIImage(systemName: "divide"), for: .normal)
        btnDelete.setImage(UIImage(systemName: "delete.left"), for: .normal)
        btnEquals.setImage(UIImage(systemName: "equal"), for: .normal)
        btnMultiply.setImage(UIImage(systemName: "multiply"), for: .normal)
    }
    
    func buttonStyle(button :UIButton)
    {
        
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 55/255, green: 67/255, blue: 83/255, alpha: 1)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset=CGSize(width: -3, height: -3)                                     //setting left and top shadow to desired color
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.2
        button.layer.cornerRadius=15
    }
    
    func viewStyle(view :UIView)
    {
        view.layer.shadowColor = UIColor.black.cgColor
       view.backgroundColor = UIColor(red: 55/255, green: 67/255, blue: 83/255, alpha: 1)
        view.layer.shadowOffset=CGSize(width: 3, height: 3)                                        //setting right and bottom shadow desired color
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius=15
    }


}

