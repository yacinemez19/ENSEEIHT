Require Import Naturelle.
Section Session1_2024_Logique_Exercice_1.

Variable A B : Prop.

Theorem Exercice_1_Naturelle :  ((A \/ (~B)) /\ B) -> A.
Proof.
I_imp H.
E_ou (A) (~B).
E_et_g (B).
Hyp H.
I_imp H1.
Hyp H1.
I_imp H2.
E_antiT.
E_non (B).
E_et_d (A \/ ~ B).
Hyp H.
Hyp H2.
Qed.

Theorem Exercice_1_Coq : ((A \/ (~B)) /\ B) -> A.
Proof.
intro.
destruct H.
destruct H.
exact H.
absurd (B).
exact H.
exact H0.
Qed.

End Session1_2024_Logique_Exercice_1.

