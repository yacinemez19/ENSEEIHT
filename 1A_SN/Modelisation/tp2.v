(* Ouverture d’une section *)
Section LogiquePredicats.

(* Définition de 2 domaines pour les prédicats *) 
Variable A B : Type.

(* Formule du second ordre : Quantification des prédicats P et Q *) 
Theorem Thm_8 : forall (P Q : A -> Prop), (* Quantification du second ordre : P et Q sont des prédicats *)
     (forall x1 : A, (P x1) /\ (Q x1))    (* Quantification du premier ordre : x1, x2 et x3 sont des données de type A *)
     -> 
     (forall x2 : A, (P x2)) /\ (forall x3 : A, (Q x3)). (* conclusion : P est vrai pour toute valeur de x2 et Q est vrai pour toute valeur de x3 *)
intros.
split.
intro.
cut (P x2 /\ Q x2).
intro.
elim H0.
intros HA HB.
exact HA.
generalize x2.
exact H.
intro.
cut (P x3 /\ Q x3).
intro.
elim H0.
intros HA HB.
exact HB.
generalize x3.
exact H.
Qed.

(* Formule du second ordre : Quantification du prédicat P *) 
Theorem Thm_9 : forall (P : A -> (B -> Prop)), (* P est un prédicat de 2 variables de type A pour la première et B pour la seconde *)
     (exists x1 : A, forall y1 : B, (P x1 y1)) (* hypothèse : il existe une valeur de A notée x1, telle que P est vrai pour toute valeur y1 de A -- même x1 pour tous les y1 *)
     -> 
     forall y2:B, exists x2:A, (P x2 y2).      (* conclusion : pour toute valeur y2 de A, il existe une valeur de A notée x2 telle que P(x2 , y2) -- prenons x2 = x1 et donc y1 = y2 *) 
intro.
intro.
intro.
destruct H.
exists x.
generalize y2.
exact H.
Qed.

(* Formule du second ordre : Quantification des prédicats P et Q *) 
Theorem Thm_10 : forall (P Q : A -> Prop),
     (exists x1 : A, (P x1) -> (Q x1)) (* hyp 1 : il existe une valeur de A notée x1, telle que si P est vraie pour cette valeur alors Q est vraie pour cette valeur *)
     -> 
     (forall x2 : A, (P x2))           (* hyp 2 : P est vraie pour toutes valeurs notée x2 de A *)
     -> 
     exists x3 : A, (Q x3).            (* conclusion : il y a au moins une valeur de A notée x 3 pour laquelle Q est vraie : x1 car  P est vraie pour toutes les valeurs de A donc pour x1 en particulier *)
(* A COMPLETER *)
intros.
destruct H.
exists x.
cut (P x).
exact H.
generalize x.
exact H0.
Qed.
End LogiquePredicats.
Variable H : Type.

Variable P : H -> H -> Prop.

Variable GPP : H -> H -> Prop.

Theorem T : (forall (e : H), exists (p : H), (P e p))    (* Tout enfant a un père *)
     /\                                                  (* et *)
     (forall (e : H), forall (gpp : H), ((GPP e gpp)     (* Le grand père paternel *)
          <-> exists (p : H), (P e p) /\ (P p gpp)))     (* est le père du père *)
     -> (forall (e : H), exists (gpp : H), (GPP e gpp)). (* alors tout enfant a un grand père paternel *)
intros.

Qed.








