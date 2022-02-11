//
//  RobotPathController.swift
//  AlgorithmSwift
//
//  Created by Lazyloading on 2022/2/9.
//

import UIKit

class RobotPathController: BaseViewController {
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
        //机器人移动最大路径
        /**
         这个题和矩阵中的路径（https://leetcode-cn.com/classic/problems/ju-zhen-zhong-de-lu-jing-lcof/description/） 题目相似
         */
        
        let m = 35;
        let n = 15;
        let k = 9;
        //正确答案：35 15 9 答案135个
        //正确答案：20 20 9 答案145个
        
        print("深度递归\(movingCount(m, n, k))")
        print("广度队列\(bfs(m: m, n: n, k: k))");
        print("深度栈\(dfsStack(m: m, n: n, x: 0, y: 0, k: k))")
        print("递推\(recurrence(m, n, k))")
    }
    
    func movingCount(_ m:Int,_ n:Int,_ k:Int) -> Int {
        
        if m<=0 || n<=0 || k<0{
            return 0;
        }
        //1. 根据mn范围，创建一个空二维数组，用来代表每个坐标，并标记访问过的每个区域
        var visit : [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        
        //2. 调用递归方法，不断检索
        dfsRecursive(m: m, n: n, x: 0, y: 0, k: k,visit: &visit);
        return count;
    }
    
    //深度优先搜索 递归实现
    func dfsRecursive(m:Int,n:Int, x:Int,y:Int, k:Int,visit : inout [[Bool]])  {
        
        if x<0 || x >= m || y<0 || y >= n  || ( visit[x][y] == true) {
            return
        }
        
        let sum = sums(x) + sums(y)
        if sum > k {
            return
        }
        
        visit[x][y] = true;
        
        count += 1;
        //每个点都检索他的右侧，下侧
        dfsRecursive(m: m, n: n, x: x+1, y: y, k: k,visit: &visit)
        dfsRecursive(m: m, n: n, x: x, y: y+1, k: k, visit: &visit)
//        dfsRecursive(m: m, n: n, x: x-1, y: y, k: k, visit: &visit)
//        dfsRecursive(m: m, n: n, x: x, y: y-1, k: k, visit: &visit)
        
        return ;
    }
    
    
    func dfsStack(m:Int,n:Int, x:Int,y:Int, k:Int)->Int {
        
        var visit : [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        var count = 0
//        var stack = [[Int]]();
//        stack.append([0,0])
//        while !stack.isEmpty {
//            let first = stack.last;
//            let x = first![0];
//            let y = first![1];
//            if x<0 || x >= m || y<0 || y >= n  || ( visit[x][y] == true) || (sums(x) + sums(y) > k) {
//                continue;
//            }
//            count += 1;
//            visit[x][y] = true;
//            for <#item#> in <#items#> {
//                <#code#>
//            }
//
//        }
        visit[0][0] = true;
        for x in 0..<m {
            for y in 0..<n {
                if (sums(x) + sums(y) > k) {
                    continue;
                }
                if x >= 1 {
                    visit[x][y] = visit[x][y] || visit[x-1][y];
                }
                if y >= 1 {
                    visit[x][y] = visit[x][y] || visit[x][y-1];
                }
                if visit[x][y] {
                    count += 1;
                }
            }
        }
        
        
        return count;
    }
    
    
    /// 找规律递推法
    func recurrence(_ m:Int,_ n:Int, _ k:Int) -> Int {
        //通过分析可以找到规律，每一个可达的点，都可以通过它左侧或者上侧的点到达，如果不能通过左侧或上侧到达则此坐标点不可达
        var visit : [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
        var count = 0
        visit[0][0] = true;
        //遍历每一个点
        for x in 0..<m {
            for y in 0..<n {
                //条件1：如果和大于k跳过循环
                if (sums(x) + sums(y) > k) {
                    continue;
                }
                //条件2：如果当前元素的左侧或者上侧可以访问，则当前点也可访问
                if x >= 1 {
                    //查看是否可通过左侧点到达，
                    visit[x][y] = visit[x][y] || visit[x-1][y];
                }
                if y >= 1 {
                    visit[x][y] = visit[x][y] || visit[x][y-1];
                }
                if visit[x][y] {
                    count += 1;
                }
            }
        }
        return count;
    }
    
    
    /**
     广度优先搜索步骤
     //1.从一个起始元素开始
     //2.查找所有和起始元素直接相连的元素，记录下来，并移除起始元素
     //3.然后依次取出记录的元素，重复开始第一步，直到符合条件
     */
    
    //:广度优先搜索（队列实现）
    func bfs(m:Int,n:Int, k:Int) -> Int{
        if m<=0 || n<=0 || k<0{
            return -1;
        }
        //队列保存要遍历的每一层元素
        var queue = [[Int]]();
        var count = 0;
        //1. 根据mn范围，创建一个空二维数组，用来代表每个坐标，并将访问过的每个区域标记true
        var visit : [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)

        //添加起点坐标为第一个元素
        queue.append([0,0])
        while !queue.isEmpty {
            //取出第一个元素
            let first = queue.first;
            //移除第一个元素
            queue.remove(at: 0);
            let x = first![0];
            let y = first![1];
            //判断取出的元素是否符合条件，符合条件则说明已经到可行范围边缘或已经访问过，跳过，进行下一次循环
            if x<0 || x >= m || y<0 || y >= n  || ( visit[x][y] == true) || (sums(x) + sums(y) > k) {
                continue;
            }
            //到此处证明当前元素未访问过，次数加一
            count += 1;
            //并将当前元素位置标记为已访问
            visit[x][y] = true;
//            print([x,y])
            //且将当前元素右侧和下侧元素加入队列，继续遍历
            queue.append([x+1,y])
            queue.append([x,y+1])
        }
        
        return count;
        
    }
    
    //MARK: 求和
    func sums(_ a:Int) -> Int {
        
        var temp = a;
        var result = 0;
        while temp > 0 {
            result += temp % 10;
            temp = Int(temp / 10);
        }
        return result;
    }
}
