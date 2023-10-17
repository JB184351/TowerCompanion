//
//  CreateTextFile.swift
//  TowerCompanion
//
//  Created by Justin on 10/16/23.
//

import Foundation

struct CreateText {
    static func createTextFile(withContent content: String, fileName: String) -> URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectory.appendingPathComponent(fileName)

        do {
            try content.write(to: fileURL, atomically: false, encoding: .utf8)
            print("Text file created successfully at: \(fileURL.path)")
            return fileURL
        } catch {
            print("Error creating the text file: \(error)")
            return nil
        }
    }
    
    static func createText(for run: TowerRun) -> String {
        var traitText = ""
        var artifactText = ""
        var parasiteText = ""
        var malfunctionText = ""
        
        if run.weapon.traits.count > 0 {
            traitText += "Traits:\n"
        }
        
        for (index, item) in run.weapon.traits.enumerated() {
            traitText += "\(item.name) \(item.level)"
            
            // Append a new line character if it's not the last item.
            if index < run.weapon.traits.count - 1 {
                traitText += "\n"
            }
        }
        
        
        if run.weapon.traits.count > 0 {
            traitText += "\n"
        }
        
        if let artifacts = run.artifacts {
            artifactText += "Artifacts:\n"
            
            for (index, item) in artifacts.enumerated() {
                artifactText += item.name
                
                // Append a new line character if it's not the last item.
                if index < artifacts.count - 1 {
                    artifactText += "\n"
                }
            }
            
            artifactText += "\n"
        }
        
    
        
        if let parasites = run.parasites {
            parasiteText += "Parasites:\n"
            
            for (index, item) in parasites.enumerated() {
                parasiteText += item.name
                
                // Append a new line character if it's not the last item.
                if index < parasites.count - 1 {
                    parasiteText += "\n"
                }
            }
            
            if parasites.count > 0 {
                parasiteText += "\n"
            }
        }
        
        if let malfunctions = run.malfunctions {
            if malfunctions.count > 0 {
                malfunctionText += "Malfunctions:\n"
                
                for (index, item) in malfunctions.enumerated() {
                    if item.malfunctionType == .permanent {
                        malfunctionText += "\(item.malfunctionDescription) (Permanent)"
                    } else {
                        malfunctionText += "Malfunction Description: \(item.malfunctionDescription)"
                        malfunctionText += "\n"
                        malfunctionText += " Condition To Remove: \(item.malfunctionDescription)"
                    }
                    
                    // Append a new line character if it's not the last item.
                    if index < malfunctions.count - 1 {
                        malfunctionText += "\n"
                    }
                }
                
                malfunctionText += "\n"
            }
        }
        
        let content = """
    Scout Name: \(run.scoutName)
    Platform: \(run.platform)

    Score: \(run.score.formatted())
    Phase: \(run.phase)
    Room: \(run.room)

    Final Multiplier: \(run.finalMultiplier)%
    Average Multiplier: \(run.averageMultiplier)%
    Highest Multiplier: \(run.highestMultiplier)%

    Date Started: \(run.dateStarted.formatted())
    Date Completed: \(run.dateCompleted.formatted())
     
    Weapon Details:
    Weapon Name: \(run.weapon.name)
    Alt-Fire: \(run.weapon.altFire.name) \(run.weapon.altFire.level)
    \(traitText)
    \(artifactText)
    \(malfunctionText)
    Stats:
    Weapon Damage: \(run.stats.weaponDamage)%
    Protection: \(run.stats.protection)%
    Proficiency Rate: \(run.stats.proficiencyRate)%
    Repair Efficiency: \(run.stats.repairEfficiency)%
    Alt-Fire Cooldown: \(run.stats.altFireCoolDown) seconds
    """
        
        return content
    }
}


