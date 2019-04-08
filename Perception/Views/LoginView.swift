import UIKit

class LoginView: UIView {
    
    public lazy var appLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logoTransparent")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    public lazy var segmentedControl: UISegmentedControl = {
        let items = ["Log In", "Register"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        sc.tintColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        return sc
    }()
    
    public lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 3
        tf.font = .systemFont(ofSize: 14)
        tf.placeholder = "email@perception.com"
        return tf
    }()
    
    public lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 3
        tf.font = .systemFont(ofSize: 14)
        tf.isSecureTextEntry = true
        tf.placeholder = "password"
        return tf
    }()
    
    public lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.1276455522, green: 0.2034990788, blue: 0.3436715901, alpha: 1), for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.layer.cornerRadius = 3
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        backgroundColor = #colorLiteral(red: 0.1276455522, green: 0.2034990788, blue: 0.3436715901, alpha: 1)
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(appLogoImageView)
        addSubview(segmentedControl)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(button)
        
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        appLogoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        appLogoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 33).isActive = true
        appLogoImageView.widthAnchor.constraint(equalTo: appLogoImageView.heightAnchor, multiplier: 1).isActive = true
        appLogoImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        
        
        segmentedControl.topAnchor.constraint(equalTo: appLogoImageView.bottomAnchor, constant: -44).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: appLogoImageView.leadingAnchor, constant: 11).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: appLogoImageView.trailingAnchor, constant: -11).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 22).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 22).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor).isActive = true
        
        button.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor).isActive = true
        button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 22).isActive = true
        button.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        
        
    }
}