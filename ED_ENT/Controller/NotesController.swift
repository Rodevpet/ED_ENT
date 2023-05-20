//
//  NotesController.swift
//  ED_ENT
//
//  Created by Robin PETIT on 08/05/2023.
//

import Foundation
class NotesController {
    var DATA:NotesDataStruct_root?
    init (XToken:String,Statut:String,id:String){
        let body = "data=%7B%22anneeScolaire%22%3A%20%22%22%20%7D"
        let postData =  body.data(using: .utf8)
        var Stat = ""
        if (Statut=="E"){
            Stat="eleves"
        }
        var request = URLRequest(url: URL(string: "https://api.ecoledirecte.com/v3/"+Stat+"/"+id+"/notes.awp?verbe=get&v=4.30.0")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("EDENT/1.0", forHTTPHeaderField: "User-Agent")
        request.addValue(String(body.utf8.count), forHTTPHeaderField: "Content-Length")
        request.addValue("api.ecoledirecte.com", forHTTPHeaderField: "Host")
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue(XToken, forHTTPHeaderField: "X-Token")
        //Get response
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                guard let notes:NotesDataStruct_root = try? JSONDecoder().decode(NotesDataStruct_root.self, from: data)else{
                    _ = try! JSONDecoder().decode(NotesDataStruct_root.self, from: data)
                    return
                }
                DispatchQueue.main.async {
                    self.DATA=notes
                    self.sort(data: self.DATA!)
                }
            }
        }
        task.resume()
    }
    
    func sort (data:NotesDataStruct_root){
        let periode_not_sorted = data.data!.periodes
        var periode_sorted:[Periode] = []
        for i in periode_not_sorted {
            let period_Builder:BuilderPeriode = BuilderPeriode()
            .setIdPeriode(id: i.idPeriode)
            .setCodePeriode(codePeriode: i.codePeriode)
            .setPeriode(periode: i.periode)
            .setDateDebut(dateDebut: i.dateDebut)
            .setDateFin(dateFin: i.dateFin)
            .setCloture(cloture: i.cloture)
            .setEnsembleMatiere(Ensemble_Matiere: EnsembleMatiere(nomPP: i.ensembleMatieres.nomPP, appreciationPP: i.ensembleMatieres.appreciationPP))
            for x in i.ensembleMatieres.disciplines {
                let discipline_Builder:BuilderDiscipline = BuilderDiscipline()
                    .setId(id: x.id)
                    .setCodeMatiere(codeMatiere:x.codeMatiere)
                    .setDiscipline(discipline:x.discipline)
                    .setMoyenne(moyenne: x.moyenne ?? "")
                    .setmoyenneClasse(moyenneClasse:x.moyenneClasse ?? "")
                    .setMoyenneMin(moyenneMin:x.moyenneMin ?? "")
                    .setMoyenneMax(moyenneMax:x.moyenneMax ?? "")
                    .setEffectif(effectif: x.effectif)
                    .setRang(rang: x.rang)
                    .appendAppreciation(appreciation:x.appreciations==[] ? "":x.appreciations?[0] ?? "")
                var professeur:[Professeur] = []
                for y in x.professeurs{
                    let professeur_Builder:BuilderProfesseur = BuilderProfesseur()
                        .setId(id: y.id)
                        .setNom(nom: y.nom)
                    professeur.append(professeur_Builder.Build())
                }
                discipline_Builder.setProfesseurs(professeurs: professeur)
                for y in data.data!.notes{
                    let notes_Builder:BuilderNote = BuilderNote()
                        .setId(id: y.id)
                        .setDevoir(devoir: y.devoir)
                        .setCodePeriode(codePeriode: y.codePeriode)
                        .setCodeMatiere(codeMatiere: y.codeMatiere)
                        .setLibelleMatiere(libelleMatiere: y.libelleMatiere)
                        .setTypeDevoir(typeDevoir: y.typeDevoir)
                        .setCoef(coef: y.coef)
                        .setNoteSur(noteSur: y.noteSur)
                        .setValeur(valeur: y.valeur)
                        .setNonSignificatif(nonSignificatif: y.nonSignificatif)
                        .setDate(date: y.date)
                        .setDateSaisie(dateSaisie: y.dateSaisie)
                        .setValeurisee(valeurisee: y.valeurisee)
                        .setMoyenneClasse(moyenneClasse: y.moyenneClasse)
                        .setMinClasse(minClasse: y.minClasse)
                        .setMaxClasse(maxClasse: y.maxClasse)
                    if (y.codePeriode==i.codePeriode){
                        if(y.codeMatiere==x.codeMatiere){
                            notes_Builder.Verification()
                            discipline_Builder.appendNote(note: notes_Builder.Build())
                        }
                    }
                }
                discipline_Builder.Verification()
                _ = period_Builder.appendDiscipline(discipline: discipline_Builder.Build())
            }
            period_Builder.Verification()
            periode_sorted.append(period_Builder.Build())
            
        }
        print (periode_sorted[0].Discipline[0].notes[0].valeur)
    }
}
