//
//  ViewController.swift
//  Device-Details
//
//  Created by Sahil Agashe on 27/04/23.
//

import UIKit
import MachO

class ViewController: UIViewController {

    // MARK: - Properties
    
    private let showDetailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.setTitle("Show Details", for: .normal)
        button.addTarget(self, action: #selector(handleShowDetailsButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private let iOSVersionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "iOS Version"
        return label
    }()
    
    private let iOSVersionDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = " \(UIDevice.current.systemVersion)"
        label.textColor = .red
        return label
    }()
    
    private let deviceModelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Device Model"
        return label
    }()
    
    private let deviceModelDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = " \(UIDevice.current.model)"
        label.textColor = .red
        return label
    }()
    
    private let deviceNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Device Name"
        return label
    }()
    
    private let deviceNameDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = " \(UIDevice.current.name)"
        label.textColor = .red
        return label
    }()
    
    private let batteryStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Battery Status"
        return label
    }()
    
    private let batteryStatusDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
        return label
    }()
    
    private let batteryLevelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Battery Level"
        return label
    }()
    
    private let batteryLevelDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = String(UIDevice.current.batteryLevel)
        label.textColor = .red
        return label
    }()
    
    private let totalDiskSpaceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Total Disk Space"
        return label
    }()
    
    private let totalDiskSpaceDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = UIDevice.current.totalDiskSpaceInGB
        label.textColor = .red
        return label
    }()
    
    private let usedDiskSpaceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Used Disk Space"
        return label
    }()
    
    private let usedDiskSpaceDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = UIDevice.current.usedDiskSpaceInGB
        label.textColor = .red
        return label
    }()
    
    private let freeDiskSpaceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Free Disk Space"
        return label
    }()
    
    private let freeDiskSpaceDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = UIDevice.current.freeDiskSpaceInGB
        label.textColor = .red
        return label
    }()
    
    private let cpuArchitectureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "CPU Architecture"
        return label
    }()
    
    private let cpuArchitectureDetailLabel: UILabel = {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
        return label
    }()
    
    private let containerStack = UIStackView()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Device Details"
        configureUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape {
            print("Landscape Mode is Active")
        }
        else  {
            print("Portrail Mode is Active")
        }
    }
    
    
    // MARK: - Selectors
    
    @objc func handleShowDetailsButtonAction() {

        if containerStack.isHidden {
            containerStack.isHidden = false
            showDetailsButton.setTitle("Hide Details", for: .normal)
        }
        else {
            containerStack.isHidden = true
            showDetailsButton.setTitle("Show Details", for: .normal)
        }
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(showDetailsButton)
        showDetailsButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100)
        showDetailsButton.setDimensions(width: 200, height: 40)
        
        let stack1 = UIStackView(arrangedSubviews: [iOSVersionLabel,iOSVersionDetailLabel])
        stack1.axis = .horizontal
        stack1.spacing = 5
        stack1.distribution = .fillEqually
        
        let stack2 = UIStackView(arrangedSubviews: [deviceModelLabel,deviceModelDetailLabel])
        stack2.axis = .horizontal
        stack2.spacing = 5
        stack2.distribution = .fillEqually
        
        let stack3 = UIStackView(arrangedSubviews: [deviceNameLabel,deviceNameDetailLabel])
        stack3.axis = .horizontal
        stack3.spacing = 5
        stack3.distribution = .fillEqually
        
        batteryStatusDetailLabel.text = getBatteryStatus()
        let stack4 = UIStackView(arrangedSubviews: [batteryStatusLabel,batteryStatusDetailLabel])
        stack4.axis = .horizontal
        stack4.spacing = 5
        stack4.distribution = .fillEqually
        
        let stack5 = UIStackView(arrangedSubviews: [batteryLevelLabel, batteryLevelDetailLabel])
        stack5.axis = .horizontal
        stack5.spacing = 5
        stack5.distribution = .fillEqually
        
        let stack6 = UIStackView(arrangedSubviews: [totalDiskSpaceLabel, totalDiskSpaceDetailLabel])
        stack6.axis = .horizontal
        stack6.spacing = 5
        stack6.distribution = .fillEqually
        
        let stack7 = UIStackView(arrangedSubviews: [usedDiskSpaceLabel, usedDiskSpaceDetailLabel])
        stack7.axis = .horizontal
        stack7.spacing = 5
        stack7.distribution = .fillEqually
        
        let stack8 = UIStackView(arrangedSubviews: [freeDiskSpaceLabel, freeDiskSpaceDetailLabel])
        stack8.axis = .horizontal
        stack8.spacing = 5
        stack8.distribution = .fillEqually
        
        cpuArchitectureDetailLabel.text = getArchitecture() as String
        let stack9 = UIStackView(arrangedSubviews: [cpuArchitectureLabel, cpuArchitectureDetailLabel])
        stack9.axis = .horizontal
        stack9.spacing = 5
        stack9.distribution = .fillEqually
        
        containerStack.addArrangedSubview(stack1)
        containerStack.addArrangedSubview(stack2)
        containerStack.addArrangedSubview(stack3)
        containerStack.addArrangedSubview(stack4)
        containerStack.addArrangedSubview(stack5)
        containerStack.addArrangedSubview(stack6)
        containerStack.addArrangedSubview(stack7)
        containerStack.addArrangedSubview(stack8)
        containerStack.addArrangedSubview(stack9)
        
        containerStack.axis = .vertical
        containerStack.spacing = 10
        containerStack.distribution = .fillEqually
        view.addSubview(containerStack)
        containerStack.centerX(inView: view, topAnchor: showDetailsButton.bottomAnchor, paddingTop: 50)
        
        containerStack.isHidden = true
    }

    func getBatteryStatus() -> String {
        let batteryState = UIDevice.current.batteryState
        
        switch batteryState {
        case .unplugged: return "Unplugged"
        case.unknown: return "Unknown"
        case .charging: return "Charging"
        case .full: return "Charged Full"
        default: break
        }
        
        return "Unable to get battery status!"
    }
    
    func hostCPULoadInfo() -> host_cpu_load_info? {
        let HOST_CPU_LOAD_INFO_COUNT = MemoryLayout<host_cpu_load_info>.stride/MemoryLayout<integer_t>.stride
        var size = mach_msg_type_number_t(HOST_CPU_LOAD_INFO_COUNT)
        var cpuLoadInfo = host_cpu_load_info()

        let result = withUnsafeMutablePointer(to: &cpuLoadInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: HOST_CPU_LOAD_INFO_COUNT) {
                host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &size)
            }
        }
        if result != KERN_SUCCESS{
            print("Error  - \(#file): \(#function) - kern_result_t = \(result)")
            return nil
        }
        return cpuLoadInfo
    }
    
    private func getArchitecture() -> NSString {
        let info = NXGetLocalArchInfo()
        return NSString(utf8String: (info?.pointee.description)!)!
    }

    
}

