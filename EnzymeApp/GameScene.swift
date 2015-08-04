//
//  GameScene.swift
//  EnzymeApp
//
//  Created by admin on 2/22/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
}
    
    override init(size: CGSize) {
        super.init(size: size)

        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth*CGFloat(NumColumns)/2,
            y: -TileHeight*CGFloat(NumRows)/2)
        
        componentsLayer.position = layerPosition
        gameLayer.addChild(componentsLayer)
        
        swipeFromColumn = nil
        swipeFromRow = nil
        
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //self.direction()
        
        self.check()
        
        //level.substrateComponents()
        
    
    }
    
    func substratecheck() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row) {
                    let type = ComponentType.Substrate
                    
                    if component.componentType == type {
                        self.direction()
                    }
                        
                    else {
                        self.substratecheck()
                    }
                }
            }
        }
    }

    
    func countrxnpieces() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    var rxnpieces = 0
                    if component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product {
                        
                        
                        //for var i = column ; i < NumColumns && component[i, row].componentType == ComponentType.Substrate; ++i, ++rxnpieces {}
                        
                        //var rxnpieces = 0
                        ++rxnpieces
                            
                        print("components \(component.column, component.row, component.componentType)")
                        print("rxnpieces: \(rxnpieces)")                       
                        
                        
                        self.direction()
                        //level.detectPossibleSwaps()
                        
                        }

                    //level.detectPossibleSwaps()

                    //}
                }
            }
        }
        //self.cycle()
    }
    
    func countcomponents() {
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    //var rxnpieces = 0
                    //if component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product {
                        
                        //++rxnpieces
                        //print("components \(component.column, component.row, component.componentType)")

                        //print("rxnpieces: \(rxnpieces)")

                        repeat {
                    //while component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product {

                            //print("rxnpieces: \(rxnpieces)")

                            //level.detectPossibleSwaps()
                            self.direction()
                            level.detectPossibleSwaps()
                            self.countcomponents()
                            //level.detectPossibleSwaps()
                            
                        }
                            while component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product
                            //while rxnpieces != 0
                    //}
                }
            }
        }
        
        
        
    }
    
    func swapcheck() {
        level.detectPossibleSwaps()
        
        if level.checkswaps() {
            if subs() {
                
            }
        }
            
        else {
            self.check()
            level.detectPossibleSwaps()
        }
    }
    
    func check() {
        self.direction()
        level.detectPossibleSwaps()
        
        if level.checkswaps() {
            if subs() {
                level.substrateComponents()
                level.locaterxns()
                //self.check()
                
                //self.direction()
                self.direction2()
                //self.subs()
                
                //level.locaterxns()
                //self.check()
            }
            
            else {
                return
            }
            
        }
            
        else {
            self.check()
        }
    }
    
    func substrates() {
        level.substrateComponents()
        level.locaterxns()
        self.direction()
        self.substrates()
    }
    
    /*func countcomponents() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    //var rxnpieces = 0
                    //if component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product {
                    //++rxnpieces
                    
                    //repeat {
                    while component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product {
                        
                        //++rxnpieces
                        
                        //print("rxnpieces: \(rxnpieces)")
                        
                        //level.detectPossibleSwaps()
                        self.direction()
                        
                        level.detectPossibleSwaps()
                        
                    }
                    //while component.componentType != ComponentType.Enzyme && component.componentType != ComponentType.Product
                    //while rxnpieces != 0
                    //}
                }
            }
        }
        
        
    }*/
    
    
    
    func cycle() {
        if subs() {
            level.detectPossibleSwaps()
            self.direction()
        }
    }
    


    func subs() -> Bool {
        let type = ComponentType.Substrate
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    if component.componentType == type {
                        print("component: \(component.componentType, component.column, component.row )")
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func product() -> Bool {
        let type = ComponentType.Product
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row){
                    if component.componentType == type {
                        print("component: \(component.componentType, component.column, component.row )")
                        return true
                    }
                }
            }
        }
        return false
    }
    
    
    

    func direction() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                swipeFromColumn = column
                swipeFromRow = row
                
                var horzDelta = 0, vertDelta = 0
                if row == 0 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                if row == NumRows - 1 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                if row == 0 && column == NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                if row == NumRows - 1 && column == 0 {
                    let dataConverter = Int(arc4random_uniform(2)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                    
                else if row == 0 && column != 0 && column != NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                    
                else if row == NumRows - 1 && column != 0 && column != NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                    
                else if column == 0 && row != 0 && row != NumRows - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = 1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                    
                else if column == NumColumns - 1 && row != 0 && row != NumRows - 1 {
                    let dataConverter = Int(arc4random_uniform(3)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        vertDelta = -1
                    }
                    else if dataConverter == 3 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
                
                else if row != 0 && row != NumRows - 1 && column != 0 && column != NumColumns - 1 {
                    let dataConverter = Int(arc4random_uniform(4)+1)
                    if dataConverter == 1 {
                        horzDelta = -1
                    }
                    else if dataConverter == 2 {
                        horzDelta = 1
                    }
                    else if dataConverter == 3 {
                        vertDelta = -1
                    }
                    else if dataConverter == 4 {
                        vertDelta = 1
                    }
                    print("location: \(swipeFromColumn, swipeFromRow)")
                    print("dataConverter: \(dataConverter)")
                    print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                    trySwapHorizontal(horzDelta, vertical: vertDelta)
                }
            }
        }
    }
    
    
    
    
    func other(component: Component, horzDelta: Int, vertDelta: Int) {
        if let sprite = component.sprite {
            if sprite.actionForKey("removing") == nil {
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                scaleAction.timingMode = .EaseOut
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(4), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
            }
        }
        
        let component1 = Component(column: swipeFromColumn! + horzDelta, row: swipeFromRow! + vertDelta, componentType: ComponentType.Enzyme)
        let component2 = Component(column: swipeFromColumn!, row: swipeFromRow!, componentType: component.componentType)
        
        
        let sprite1 = SKSpriteNode(imageNamed: component1.componentType.spriteName)
        sprite1.position = pointForColumn(component1.column, row: component1.row)
        componentsLayer.addChild(sprite1)
        component1.sprite = sprite1
        
        let sprite2 = SKSpriteNode(imageNamed: component2.componentType.spriteName)
        sprite2.position = pointForColumn(component2.column, row: component2.row)
        componentsLayer.addChild(sprite2)
        component2.sprite = sprite2
        
        
        trySwapHorizontal2(component1, component2: component2)
    }
    

    
    

    func direction2() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let component = level.componentAtColumn(column, row: row) {
                    if component.componentType == ComponentType.Substrate {
                        print("component: \(component.componentType, component.column, component.row)")
                        
                        
                        swipeFromColumn = component.column
                        swipeFromRow = component.row
                        
                        var horzDelta = 0, vertDelta = 0
                        if component.row == 0 && component.column == 0 {
                            let dataConverter = Int(arc4random_uniform(2)+1)
                            if dataConverter == 1 {
                                horzDelta = 1
                            }
                            else if dataConverter == 2 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")

                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)
                            

                        }
                        
                        if component.row == NumRows - 1 && component.column == NumColumns - 1 {
                            let dataConverter = Int(arc4random_uniform(2)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                vertDelta = -1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                        
                        if component.row == 0 && component.column == NumColumns - 1 {
                            let dataConverter = Int(arc4random_uniform(2)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                        
                        if component.row == NumRows - 1 && component.column == 0 {
                            let dataConverter = Int(arc4random_uniform(2)+1)
                            if dataConverter == 1 {
                                horzDelta = 1
                            }
                            else if dataConverter == 2 {
                                vertDelta = -1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                            
                        else if component.row == 0 && component.column != 0 && component.column != NumColumns - 1 {
                            let dataConverter = Int(arc4random_uniform(3)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                horzDelta = 1
                            }
                            else if dataConverter == 3 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                            
                        else if component.row == NumRows - 1 && component.column != 0 && component.column != NumColumns - 1 {
                            let dataConverter = Int(arc4random_uniform(3)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                horzDelta = 1
                            }
                            else if dataConverter == 3 {
                                vertDelta = -1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                            
                        else if component.column == 0 && component.row != 0 && component.row != NumRows - 1 {
                            let dataConverter = Int(arc4random_uniform(3)+1)
                            if dataConverter == 1 {
                                horzDelta = 1
                            }
                            else if dataConverter == 2 {
                                vertDelta = -1
                            }
                            else if dataConverter == 3 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                            
                        else if component.column == NumColumns - 1 && component.row != 0 && component.row != NumRows - 1 {
                            let dataConverter = Int(arc4random_uniform(3)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                vertDelta = -1
                            }
                            else if dataConverter == 3 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                            
                        else if component.row != 0 && component.row != NumRows - 1 && component.column != 0 && component.column != NumColumns - 1 {
                            let dataConverter = Int(arc4random_uniform(4)+1)
                            if dataConverter == 1 {
                                horzDelta = -1
                            }
                            else if dataConverter == 2 {
                                horzDelta = 1
                            }
                            else if dataConverter == 3 {
                                vertDelta = -1
                            }
                            else if dataConverter == 4 {
                                vertDelta = 1
                            }
                            print("location: \(swipeFromColumn, swipeFromRow)")
                            print("dataConverter: \(dataConverter)")
                            print("horzDelta, vertDelta: \(horzDelta, vertDelta)")
                            
                            
                            other(component, horzDelta: horzDelta, vertDelta: vertDelta)


                        }
                    }
                }
            }
        }
    }

    
      
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchesEnded(touches!, withEvent: event)
    }

    var swipeHandler: ((Swap) -> ())?
    
    var swipeFromColumn: Int?
    var swipeFromRow: Int?
    
    var level: Level!
    
    let TileWidth: CGFloat = 25
    let TileHeight: CGFloat = 25
    
    let gameLayer = SKNode()
    let componentsLayer = SKNode()
    
    func addSpritesForComponents(components: Set<Component>) {
        for component in components {
            let sprite = SKSpriteNode(imageNamed: component.componentType.spriteName)
            sprite.position = pointForColumn(component.column, row:component.row)
            componentsLayer.addChild(sprite)
            component.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns)*TileWidth &&
            point.y >= 0 && point.y < CGFloat(NumRows)*TileHeight {
                return (true, Int(point.x/TileWidth), Int(point.y/TileHeight))
        } else {
            return (false, 0, 0)
        }
    }
    
    func trySwapHorizontal(horzDelta: Int, vertical vertDelta: Int) {
        let toColumn = swipeFromColumn! + horzDelta
        let toRow = swipeFromRow! + vertDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows {return}
        
        let type = ComponentType.Enzyme
        //let type2 = ComponentType.Substrate
        if let toComponent = level.componentAtColumn(toColumn, row: toRow) {
            if let fromComponent = level.componentAtColumn(swipeFromColumn!, row: swipeFromRow!) {
                
                //if fromComponent.componentType == type && toComponent.componentType == type2 {
                    if fromComponent.componentType == type && toComponent.componentType != type {
                    
                    print("fromComponent: \(fromComponent.componentType, fromComponent.column, fromComponent.row )")
                    print("toComponent: \(toComponent.componentType, toComponent.column, toComponent.row)")
                    
                    if let handler = swipeHandler {
                        let swap = Swap(componentA: fromComponent, componentB: toComponent)
                        handler(swap)
                        
                        print("afterswapfromComponent: \(fromComponent.componentType, fromComponent.column, fromComponent.row )")
                        //print("fromComponent: \(fromComponent.column, fromComponent.row)")
                        print("afterswaptoComponent: \(toComponent.componentType, toComponent.column, toComponent.row)")
                        //print("toComponent: \(toComponent.column, toComponent.row)")
                        
                        
                        level.removepieces(fromComponent, component2: toComponent)
                        self.removecomponents(fromComponent, component2: toComponent)
                        self.combinedcomponent(fromComponent, component2: toComponent)

                        
                    }
                }
            }
        }
    }
    

    func trySwapHorizontal2(component1: Component, component2: Component) {

        let type = ComponentType.Substrate
       
                if component1.componentType != type && component2.componentType == type {
                    
                    print("component1: \(component1.componentType, component1.column, component1.row )")
                    print("component2: \(component2.componentType, component2.column, component2.row)")
                    
                    if let handler = swipeHandler {
                        let swap = Swap(componentA: component1, componentB: component2)
                        handler(swap)

        
                    print("afterswapcomponent1: \(component1.componentType, component1.column, component1.row )")
                    print("afterswapcomponent2: \(component2.componentType, component2.column, component2.row)")
                        
                        
                        level.removepieces(component1, component2: component2)
                        self.removecomponents(component1, component2: component2)
                        self.combinedcomponent(component1, component2: component2)
                        
                        
                    }
                }
    }
    

    func removeAllComponentSprites() {
        componentsLayer.removeAllChildren()
    }
    
    func removecomponents(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            if let sprite1 = component1.sprite {
                if sprite1.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
            
            if let sprite2 = component2.sprite {
                if sprite2.actionForKey("removing") == nil {
                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                    scaleAction.timingMode = .EaseOut
                    sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                }
            }
        }
    }
    
    
    func revert(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            
            if component2.componentType == ComponentType.Substrate {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                print("enzyme: \(component.column, component.row)")
                
                let newcomponentType = ComponentType.Product
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                
                print("product: \(newcomponent.column, newcomponent.row)")

            }
            
            if component2.componentType == ComponentType.Competitive_Inhibitor{
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(6), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Competitive_Inhibitor
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(6), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Deactivator {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(4.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Deactivator
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(4.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Noncompetitive_Inhibitor {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(5.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Noncompetitive_Inhibitor
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(5.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }
            
            if component2.componentType == ComponentType.Activator {
                
                let componentType = ComponentType.Enzyme
                let component = Component(column: component2.column, row: component2.row, componentType: componentType)
                let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                sprite1.position = pointForColumn(component2.column, row: component2.row)
                componentsLayer.addChild(sprite1)
                component.sprite = sprite1
                
                let newPosition1 = pointForColumn(component2.column, row: component2.row)
                let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                moveAction1.timingMode = .EaseOut
                sprite1.alpha = 0
                sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                
                let newcomponentType = ComponentType.Activator
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                let sprite2 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite2.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite2)
                newcomponent.sprite = sprite2
                
                let newPosition2 = pointForColumn(component1.column, row: component1.row)
                let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                moveAction2.timingMode = .EaseOut
                sprite2.alpha = 0
                sprite2.runAction(SKAction.sequence([SKAction.waitForDuration(5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
            }

        }
        
    }
    

    
    
    func combinedcomponent(component1: Component, component2: Component) {
        if component1.componentType == ComponentType.Enzyme {
            let time = 0.5
            let delay = 0.5
            
            print("component1: \(component1.componentType, component1.column, component1.row)")
            print("component2: \(component2.componentType, component2.column, component2.row)")
            
            if component2.componentType == ComponentType.Substrate {
                let newcomponentType = ComponentType.ESComplex
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
               

                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction, SKAction.removeFromParent()]),
                        withKey:"removing")
                
                print("escomplex: \(newcomponent.column, newcomponent.row)")

                self.revert(component1, component2: component2)
            }

        
            if component2.componentType == ComponentType.Competitive_Inhibitor {
                let newcomponentType = ComponentType.Enzyme_with_Competitive_Inhibitor
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                self.revert(component1, component2: component2)
            }
            
            if component2.componentType == ComponentType.Deactivator {
                let newcomponentType = ComponentType.Enzyme_with_deactivator
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                self.revert(component1, component2: component2)
            }
            
            if component2.componentType == ComponentType.Noncompetitive_Inhibitor {
                let newcomponentType = ComponentType.Enzyme_with_Noncompetitive_Inhibitor
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                
                if newcomponent.column != NumColumns - 1 {
                if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))

                    }
                    
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                    }
                }
                
                if newcomponent.row != NumRows - 1 {
                if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
                
                if newcomponent.row != 0 {
                if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                    if othercomponent.componentType == ComponentType.Substrate {
                        if let sprite = newcomponent.sprite {
                            //if sprite.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        
                        if let sprite2 = othercomponent.sprite {
                            //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            //}
                        }
                        let newcomponentType2 = ComponentType.Enzyme_with_Noncompetitive_Inhibitor_and_substrate
                        let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                        let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                        componentsLayer.addChild(sprite)
                        newcomponent2.sprite = sprite
                        
                        let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                        moveAction.timingMode = .EaseOut
                        sprite.alpha = 0
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                        
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                            withKey:"removing")
                        
                        
                        let componentAType = ComponentType.Enzyme
                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(spriteA)
                        componentA.sprite = spriteA
                        
                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                        moveActionA.timingMode = .EaseOut
                        spriteA.alpha = 0
                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                        
                        let componentBType = ComponentType.Noncompetitive_Inhibitor
                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(spriteB)
                        componentB.sprite = spriteB
                        
                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                        moveActionB.timingMode = .EaseOut
                        spriteB.alpha = 0
                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                        
                        let componentCType = ComponentType.Substrate
                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                        componentsLayer.addChild(spriteC)
                        componentC.sprite = spriteC
                        
                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                        moveActionC.timingMode = .EaseOut
                        spriteC.alpha = 0
                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                    }
                        
                    else {
                        self.revert(component1, component2: component2)
                    }
                }
                }
    
            }
            
            if component2.componentType == ComponentType.Activator {
                let newcomponentType = ComponentType.Enzyme_with_one_activator
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite)
                newcomponent.sprite = sprite
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite.alpha = 0
                sprite.runAction(SKAction.sequence([SKAction.fadeInWithDuration(time), moveAction]))
                
                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                sprite.runAction(SKAction.sequence([SKAction.waitForDuration(delay, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                    withKey:"removing")
                if newcomponent.column != NumColumns - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component2.column, row: component2.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component1.column, row: component1.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                            
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component2.column, row: component2.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component1.column, row: component1.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != NumRows - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component2.column, row: component2.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component1.column, row: component1.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                if newcomponent.row != 0 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                        if othercomponent.componentType == ComponentType.Substrate {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_one_activator_and_substrate
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            let componentAType = ComponentType.Enzyme
                            let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                            let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                            spriteA.position = pointForColumn(component2.column, row: component2.row)
                            componentsLayer.addChild(spriteA)
                            componentA.sprite = spriteA
                            
                            let newPositionA = pointForColumn(component2.column, row: component2.row)
                            let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                            moveActionA.timingMode = .EaseOut
                            spriteA.alpha = 0
                            spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                            let componentBType = ComponentType.Activator
                            let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                            let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                            spriteB.position = pointForColumn(component1.column, row: component1.row)
                            componentsLayer.addChild(spriteB)
                            componentB.sprite = spriteB
                            
                            let newPositionB = pointForColumn(component1.column, row: component1.row)
                            let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                            moveActionB.timingMode = .EaseOut
                            spriteB.alpha = 0
                            spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                            let componentCType = ComponentType.Substrate
                            let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                            let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                            spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                            componentsLayer.addChild(spriteC)
                            componentC.sprite = spriteC
                            
                            let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                            let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                            moveActionC.timingMode = .EaseOut
                            spriteC.alpha = 0
                            spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                        }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                    }
                }
                
                
                
                
                
                if newcomponent.column != NumColumns - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column + 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.column != NumColumns - 1 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column + 1, row: newcomponent2.row) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }

                
                if newcomponent.column != 0 {
                    
                    if let othercomponent = level.componentAtColumn(newcomponent.column - 1, row: newcomponent.row) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.column != 0 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column - 1, row: newcomponent2.row) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }

                
                if newcomponent.row != NumRows - 1 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row + 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            
                            if newcomponent2.row != NumRows - 1 {
                                if let othercomponent2 = level.componentAtColumn(newcomponent2.column, row: newcomponent2.row + 1) {
                                    if othercomponent2.componentType == ComponentType.Substrate {
                                        if let sprite = newcomponent2.sprite {
                                            //if sprite.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        if let sprite2 = othercomponent2.sprite {
                                            //if sprite2.actionForKey("removing") == nil {
                                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                            scaleAction.timingMode = .EaseOut
                                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                                withKey:"removing")
                                            //}
                                        }
                                        
                                        let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                        let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                        let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                        sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(sprite)
                                        newcomponent3.sprite = sprite
                                        
                                        let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                        moveAction.timingMode = .EaseOut
                                        sprite.alpha = 0
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                        
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                        
                                        let componentDType = ComponentType.Substrate
                                        let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                        let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                        spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        componentsLayer.addChild(spriteD)
                                        componentD.sprite = spriteD
                                        
                                        let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                        let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                        moveActionD.timingMode = .EaseOut
                                        spriteD.alpha = 0
                                        spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                    }
                                        
                                    else {
                                        
                                        let componentAType = ComponentType.Enzyme
                                        let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                        let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                        spriteA.position = pointForColumn(component2.column, row: component2.row)
                                        componentsLayer.addChild(spriteA)
                                        componentA.sprite = spriteA
                                        
                                        let newPositionA = pointForColumn(component2.column, row: component2.row)
                                        let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                        moveActionA.timingMode = .EaseOut
                                        spriteA.alpha = 0
                                        spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                        
                                        let componentBType = ComponentType.Activator
                                        let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                        let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                        spriteB.position = pointForColumn(component1.column, row: component1.row)
                                        componentsLayer.addChild(spriteB)
                                        componentB.sprite = spriteB
                                        
                                        let newPositionB = pointForColumn(component1.column, row: component1.row)
                                        let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                        moveActionB.timingMode = .EaseOut
                                        spriteB.alpha = 0
                                        spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                        
                                        let componentCType = ComponentType.Activator
                                        let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                        let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                        spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        componentsLayer.addChild(spriteC)
                                        componentC.sprite = spriteC
                                        
                                        let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                        let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                        moveActionC.timingMode = .EaseOut
                                        spriteC.alpha = 0
                                        spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                    }
                                }
                                    
                                else {
                                    self.revert(component1, component2: component2)
                                }
                            }
                        }
                    }
                }
            
            
                if newcomponent.row != 0 {
                    if let othercomponent = level.componentAtColumn(newcomponent.column, row: newcomponent.row - 1) {
                        if othercomponent.componentType == ComponentType.Activator {
                            if let sprite = newcomponent.sprite {
                                //if sprite.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            
                            if let sprite2 = othercomponent.sprite {
                                //if sprite2.actionForKey("removing") == nil {
                                let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                scaleAction.timingMode = .EaseOut
                                sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                    withKey:"removing")
                                //}
                            }
                            let newcomponentType2 = ComponentType.Enzyme_with_two_activators
                            let newcomponent2 = Component(column: newcomponent.column, row: newcomponent.row, componentType: newcomponentType2)
                            let sprite = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                            sprite.position = pointForColumn(newcomponent.column, row: newcomponent.row)
                            componentsLayer.addChild(sprite)
                            newcomponent2.sprite = sprite
                            
                            let newPosition = pointForColumn(newcomponent.column, row: newcomponent.row)
                            let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                            moveAction.timingMode = .EaseOut
                            sprite.alpha = 0
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                            
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                withKey:"removing")
                            
                            if newcomponent2.row != 0 {
                            if let othercomponent2 = level.componentAtColumn(newcomponent2.column, row: newcomponent2.row - 1) {
                                if othercomponent2.componentType == ComponentType.Substrate {
                                    if let sprite = newcomponent2.sprite {
                                        //if sprite.actionForKey("removing") == nil {
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        scaleAction.timingMode = .EaseOut
                                        sprite.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        //}
                                    }
                                    
                                    if let sprite2 = othercomponent2.sprite {
                                        //if sprite2.actionForKey("removing") == nil {
                                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                        scaleAction.timingMode = .EaseOut
                                        sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]),
                                            withKey:"removing")
                                        //}
                                    }
                                    
                                    let newcomponentType3 = ComponentType.Enzyme_with_2_activators_and_substrate
                                    let newcomponent3 = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: newcomponentType3)
                                    let sprite = SKSpriteNode(imageNamed: newcomponent3.componentType.spriteName)
                                    sprite.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    componentsLayer.addChild(sprite)
                                    newcomponent3.sprite = sprite
                                    
                                    let newPosition = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                                    moveAction.timingMode = .EaseOut
                                    sprite.alpha = 0
                                    sprite.runAction(SKAction.sequence([SKAction.waitForDuration(1.5), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction])]))
                                    
                                    let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                                    sprite.runAction(SKAction.sequence([SKAction.waitForDuration(0.25, withRange: 5), scaleAction, SKAction.removeFromParent()]),
                                        withKey:"removing")
                                    
                                    
                                    let componentAType = ComponentType.Enzyme
                                    let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                    let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                    spriteA.position = pointForColumn(component2.column, row: component2.row)
                                    componentsLayer.addChild(spriteA)
                                    componentA.sprite = spriteA
                                    
                                    let newPositionA = pointForColumn(component2.column, row: component2.row)
                                    let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                    moveActionA.timingMode = .EaseOut
                                    spriteA.alpha = 0
                                    spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                                    
                                    let componentBType = ComponentType.Activator
                                    let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                    let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                    spriteB.position = pointForColumn(component1.column, row: component1.row)
                                    componentsLayer.addChild(spriteB)
                                    componentB.sprite = spriteB
                                    
                                    let newPositionB = pointForColumn(component1.column, row: component1.row)
                                    let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                    moveActionB.timingMode = .EaseOut
                                    spriteB.alpha = 0
                                    spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                                    
                                    let componentCType = ComponentType.Activator
                                    let componentC = Component(column: newcomponent2.column, row: newcomponent2.row, componentType: componentCType)
                                    let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                    spriteC.position = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    componentsLayer.addChild(spriteC)
                                    componentC.sprite = spriteC
                                    
                                    let newPositionC = pointForColumn(newcomponent2.column, row: newcomponent2.row)
                                    let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                    moveActionC.timingMode = .EaseOut
                                    spriteC.alpha = 0
                                    spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                
                                    let componentDType = ComponentType.Substrate
                                    let componentD = Component(column: othercomponent2.column, row: othercomponent2.row, componentType: componentDType)
                                    let spriteD = SKSpriteNode(imageNamed: componentD.componentType.spriteName)
                                    spriteD.position = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                    componentsLayer.addChild(spriteD)
                                    componentD.sprite = spriteD
                                    
                                    let newPositionD = pointForColumn(othercomponent2.column, row: othercomponent2.row)
                                    let moveActionD = SKAction.moveTo(newPositionD, duration: 0.3)
                                    moveActionD.timingMode = .EaseOut
                                    spriteD.alpha = 0
                                    spriteD.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionD])]))
                                }
                                    
                                else {
                                    
                                    let componentAType = ComponentType.Enzyme
                                    let componentA = Component(column: component2.column, row: component2.row, componentType: componentAType)
                                    let spriteA = SKSpriteNode(imageNamed: componentA.componentType.spriteName)
                                    spriteA.position = pointForColumn(component2.column, row: component2.row)
                                    componentsLayer.addChild(spriteA)
                                    componentA.sprite = spriteA
                            
                                    let newPositionA = pointForColumn(component2.column, row: component2.row)
                                    let moveActionA = SKAction.moveTo(newPositionA, duration: 0.3)
                                    moveActionA.timingMode = .EaseOut
                                    spriteA.alpha = 0
                                    spriteA.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionA])]))
                            
                                    let componentBType = ComponentType.Activator
                                    let componentB = Component(column: component1.column, row: component1.row, componentType: componentBType)
                                    let spriteB = SKSpriteNode(imageNamed: componentB.componentType.spriteName)
                                    spriteB.position = pointForColumn(component1.column, row: component1.row)
                                    componentsLayer.addChild(spriteB)
                                    componentB.sprite = spriteB
                            
                                    let newPositionB = pointForColumn(component1.column, row: component1.row)
                                    let moveActionB = SKAction.moveTo(newPositionB, duration: 0.3)
                                    moveActionB.timingMode = .EaseOut
                                    spriteB.alpha = 0
                                    spriteB.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionB])]))
                            
                                    let componentCType = ComponentType.Activator
                                    let componentC = Component(column: othercomponent.column, row: othercomponent.row, componentType: componentCType)
                                    let spriteC = SKSpriteNode(imageNamed: componentC.componentType.spriteName)
                                    spriteC.position = pointForColumn(othercomponent.column, row: othercomponent.row)
                                    componentsLayer.addChild(spriteC)
                                    componentC.sprite = spriteC
                            
                                    let newPositionC = pointForColumn(othercomponent.column, row: othercomponent.row)
                                    let moveActionC = SKAction.moveTo(newPositionC, duration: 0.3)
                                    moveActionC.timingMode = .EaseOut
                                    spriteC.alpha = 0
                                    spriteC.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveActionC])]))
                                }
                            }
                            
                        else {
                            self.revert(component1, component2: component2)
                        }
                            }
                        }
                    }
                }
            }
        }
    }
    


    func animateSwap(swap: Swap, completion: () -> ()) {
        let spriteA = swap.componentA.sprite!
        let spriteB = swap.componentB.sprite!
        
        spriteA.zPosition = 90
        spriteB.zPosition = 100
        
        let Duration: NSTimeInterval = 0.5
        
        let moveA = SKAction.moveTo(spriteB.position, duration: Duration)
        moveA.timingMode = .EaseOut
        spriteA.runAction(moveA, completion: completion)
        
        let moveB = SKAction.moveTo(spriteA.position, duration: Duration)
        moveB.timingMode = .EaseOut
        spriteB.runAction(moveB)
    }
    
    
    func animateRxnComponents2(rxns: Set<Rxn>, completion: () -> ()) {
        for rxn in rxns {
            for component in rxn.components {
                
                if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                    if let sprite1 = component1.sprite {
                        if sprite1.actionForKey("removing") == nil {
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                        }
                    }
                }
                
                        
                if component.componentType != ComponentType.Enzyme {
                    let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                    if let sprite2 = component2.sprite {
                        if sprite2.actionForKey("removing") == nil {
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                            
                        }
                    }
                }
            }
        }
        runAction(SKAction.waitForDuration(0.3), completion: completion)
    }

    
    func animateRxnComponents(rxns: Set<Rxn>, completion: () -> ()) {
        for rxn in rxns {
            for component in rxn.components {
                /*if component.componentType == ComponentType.Enzyme {
                    let component1 = component
                    if component.componentType == ComponentType.Substrate {
                        let component2 = component
                
                if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                        if component.componentType == ComponentType.Substrate {
                            let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                            //level.removepieces(component1, component2: component2)
                            self.removecomponents(component1, component2: component2)
                            self.combinedcomponent(component1, component2: component2)
                            self.revert(component1, component2: component2)
                    }
                }
            }
        }
    }*/
             
               if component.componentType == ComponentType.Enzyme {
                    let component1 = Component(column: component.column, row: component.row, componentType: ComponentType.Enzyme)
                  if let sprite1 = component1.sprite {
                    //if sprite1.actionForKey("removing") == nil {
                        let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                        scaleAction.timingMode = .EaseOut
                        sprite1.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                        

                
                if component.componentType != ComponentType.Enzyme {
                    let component2 = Component(column: component.column, row: component.row, componentType: ComponentType.Substrate)
                    
                    if let sprite2 = component2.sprite {
                        //if sprite2.actionForKey("removing") == nil {
                            let scaleAction = SKAction.scaleTo(0.1, duration: 0.3)
                            scaleAction.timingMode = .EaseOut
                            sprite2.runAction(SKAction.sequence([scaleAction, SKAction.removeFromParent()]), withKey: "removing")
                
                //let time = 0.5
                //let delay = 0.5
                
                let newcomponentType = ComponentType.ESComplex
                let newcomponent = Component(column: component1.column, row: component1.row, componentType: newcomponentType)
                
                let sprite3 = SKSpriteNode(imageNamed: newcomponent.componentType.spriteName)
                sprite3.position = pointForColumn(component1.column, row: component1.row)
                componentsLayer.addChild(sprite3)
                newcomponent.sprite = sprite3
                
                let newPosition = pointForColumn(component1.column, row: component1.row)
                let moveAction = SKAction.moveTo(newPosition, duration: 0.3)
                moveAction.timingMode = .EaseOut
                sprite3.alpha = 0
                sprite3.runAction(SKAction.sequence([SKAction.fadeInWithDuration(0.05), moveAction]))
                
                
                let scaleAction3 = SKAction.scaleTo(0.1, duration: 0.3)
                sprite3.runAction(SKAction.sequence([SKAction.waitForDuration(2), scaleAction3, SKAction.removeFromParent()]),
                    withKey:"removing")
                    
                    
                        let componentType = ComponentType.Enzyme
                        let component = Component(column: component1.column, row: component1.row, componentType: componentType)
                        let sprite1 = SKSpriteNode(imageNamed: component.componentType.spriteName)
                        sprite1.position = pointForColumn(component1.column, row: component1.row)
                        componentsLayer.addChild(sprite1)
                        component.sprite = sprite1
                        
                        let newPosition1 = pointForColumn(component1.column, row: component1.row)
                        let moveAction1 = SKAction.moveTo(newPosition1, duration: 0.3)
                        moveAction1.timingMode = .EaseOut
                        sprite1.alpha = 0
                        sprite1.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction1])]))
                        
                        let newcomponent2Type = ComponentType.Product
                        let newcomponent2 = Component(column: component2.column, row: component2.row, componentType: newcomponent2Type)
                        let sprite4 = SKSpriteNode(imageNamed: newcomponent2.componentType.spriteName)
                        sprite4.position = pointForColumn(component2.column, row: component2.row)
                        componentsLayer.addChild(sprite4)
                        newcomponent2.sprite = sprite4
                        
                        let newPosition2 = pointForColumn(component2.column, row: component2.row)
                        let moveAction2 = SKAction.moveTo(newPosition2, duration: 0.3)
                        moveAction2.timingMode = .EaseOut
                        sprite4.alpha = 0
                        sprite4.runAction(SKAction.sequence([SKAction.waitForDuration(3), SKAction.group([SKAction.fadeInWithDuration(0.25), moveAction2])]))
                    }
                    }
                        }
                    }
                    
                }
            //}
            //}

        }
        runAction(SKAction.waitForDuration(0.3), completion: completion)
    }
    

    
}

