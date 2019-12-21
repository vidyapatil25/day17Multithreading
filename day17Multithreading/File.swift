//
//  File.swift
//  day17Multithreading
//
//  Created by Felix-ITS016 on 20/12/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import Foundation
class multithread
{
    func  doLongAsyncTaskInSerial()
    {
        let serialQueue = DispatchQueue(label: "com.queue.serial");
        for i in 1...10
        {
            serialQueue.async
                {
                    if Thread.isMainThread
                {
                    print("Task running in main thread \(i)");
                }
                    else
                    {
                    print("Task running in background thread \(i)");
                    }
            }
        }
    }
    func doLongSyncTaskInSerialQueue()
    {
         let serialQueue = DispatchQueue(label: "com.queue.serial");
        for i in 1...10
        {
            serialQueue.sync
                {
                    if Thread.isMainThread
                    {
                        print("Task running in main thread \(i)");
                    }
                    else
                    {
                        print("Task running in background thread \(i)");
                    }
            }
    }
}
    func doLongAsyncTaskInConcurrentQueue()
    {
        let concurrentQueue = DispatchQueue(label: "com.queue.serial", attributes: . concurrent);
        for i in 1...10
        {
            concurrentQueue.async
                {
                    if Thread.isMainThread
                    {
                        print("Task running in main thread \(i)");
                    }
                    else
                    {
                        print("Task running in background thread \(i)");
                    }
            }
        }
    }
    func testQOS()
    {
        let queue1 = DispatchQueue(label: "com.Qos.queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.Qos.queue2", qos: DispatchQoS.background)
        for i in 1...10
        {
            queue1.async
                {
                    print("\(i)=🙂")
            }
            for i in 1...5
            {
                queue2.async
                    {
                        print("\(i)=😈")
                    }
            }
        }
    }
    func updateUI()
    {
        DispatchQueue.main.async
            {
            print("Update UI here")
        }
    }
    func doLongSyncTaskInConcurrentQueue()
    {
        let concurrentQueue = DispatchQueue(label: "com.queue.serial", attributes: . concurrent);
        for i in 1...10
        {
            concurrentQueue.sync
                {
                    if Thread.isMainThread
                    {
                        print("Task running in main thread \(i)");
                    }
                    else
                    {
                        print("Task running in background thread \(i)");
                    }
            }
        }
    }
    func blockOperationTask() {
        let operationqueue = OperationQueue()
        let operation1 : BlockOperation = BlockOperation {
            
            self.doCalculations()
        }
        
        let operation2 : BlockOperation = BlockOperation {
            
            self.doCalculations()
        }
        
        operation1.addDependency(operation2)
        operationqueue.addOperation(operation2)
        operationqueue.addOperation(operation1)
        
    }
func  doCalculations()  {
    print("doCalculations")
    for i in 100...105
    {
      print("doCalculations is \(i)")
        sleep(1)
}
    }
    func  doSomeMoreCalculations()  {
        print("do Some More Calculations")
        for j in 1...5
        {
            print("do Some More Calculations is \(j)")
            sleep(1)
        }
    }
    func checkDispatchafter()
    {
        let deadlinesTime = DispatchTime.now() + . seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlinesTime)
        {
            print("test")
        }
    }
    
}
