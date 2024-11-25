Require Import Naturelle.
Section Session1_2019_Logique_Exercice_2.

Variable A B C : Prop.

Theorem Exercice_2_Naturelle : ((A /\ B) -> C) -> (A -> C) \/ (B -> C).
Proof.
I_imp H.
E_ou (A) (~A).
TE.
I_imp H1.
I_ou_d.
I_imp H2.
E_imp (A /\ B).
Hyp H.
I_et.
Hyp H1.
Hyp H2.
I_imp H0.
I_ou_g.
I_imp H1.
E_antiT.
E_non (A).
Hyp H1.
Hyp H0.
Qed.

Theorem Exercice_2_Coq : ((A /\ B) -> C) -> (A -> C) \/ (B -> C).
Proof.
intros.
destruct (classic A) as [Ha | Hna].
right.
intro.
cut (A /\ B).
exact H.
split.
exact Ha.
exact H0.
left.
intro.
absurd (A).
exact Hna.
exact H0.
Qed.

End Session1_2019_Logique_Exercice_2.

