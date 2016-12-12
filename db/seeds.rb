Category.create!([
  {name: "Administration", code: "adm"},
  {name: "Ajout, modif., suppr. profil", code: "pro"},
  {name: "Anomalie", code: "ano"},
  {name: "Autres", code: "aut"},
  {name: "Client-Equipe projet", code: "cli"},
  {name: "Evolution", code: "evo"},
  {name: "Parametrage", code: "par"},
  {name: "Reprise de données", code: "rep"},
  {name: "Retour de recette", code: "ret"},
  {name: "Utilisation", code: "uti"}
])

SsCategorie.create!([
  {name: "a qualifier", category_id: nil},
  {name: "Administration", category_id: 10},
  {name: "Evolution", category_id: 9},
  {name: "Inc-Reprise de donnees", category_id: 8},
  {name: "Dem-Reprise de donnees", category_id: 8},
  {name: "Demande-Parametrage", category_id: 6},
  {name: "Reprise de donnée", category_id: 8},
  {name: "Incident-Parametrage", category_id: 6},
  {name: "Autres Incidents Primpromo", category_id: 4},
  {name: "Utilisation", category_id: 5},
  {name: "Autres Demandes Primpromo", category_id: 4},
  {name: "Ano-Degradation fonctionnelle", category_id: 3},
  {name: "Ano-Interruption fonctionnelle", category_id: 3},
  {name: "Ano-Interruption Technique", category_id: 3},
  {name: "Client-Equipe projet", category_id: 12},
  {name: "Retour de recette", category_id: 13}
])
