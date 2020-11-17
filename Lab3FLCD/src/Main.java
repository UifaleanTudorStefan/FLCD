import java.util.*;

public class Main {

    public static void main(String[] args) {
        FA Fa=new FA("C:\\Users\\tudi1\\IdeaProjects\\Lab3FLCD\\src\\in.txt");
        Scanner myInput = new Scanner( System.in );
        while(true) {
            System.out.println("1.States");
            System.out.println("2.Alphabet");
            System.out.println("3.Transitions");
            System.out.println("4.Initial State");
            System.out.println("5.Final State(s)");
            System.out.println("0.Stop program");
            System.out.println();

            int a = myInput.nextInt();

            if(a==1)
                System.out.println(Fa.getStates());
            if(a==2)
            System.out.println(Fa.getAlphabet());
            if(a==3)
                for (String el : Fa.getTransitions())
                    System.out.println(el);

            if(a==4)
                System.out.println(Fa.getiState());

            if(a==5)
                System.out.println(Fa.getfState());
            if(a==0)
                break;
            if(a>5 || a<0)
                System.out.println("Invalid command");

            System.out.println();
        }
    }
}
