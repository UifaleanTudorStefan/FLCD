import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class FA {
    private List<String> states = new ArrayList<>();
    private HashSet<String> alphabet = new HashSet<>();
    private List<String> transitions = new ArrayList<>();
    private String iState;
    private List<String> fState = new ArrayList<>();

    public FA() {
    }


    public FA(String filename) {
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filename))) {
            String[] line;
            String str;

            line = bufferedReader.readLine().split(" ");

            Collections.addAll(states, line);

            line = bufferedReader.readLine().split(" ");

            for(int i=0; i< line.length; i++)
            {
                if(line[i].equals("1"))
                { iState = states.get(i); }

                if(line[i].equals("-1"))
                { fState.add(states.get(i)); }
            }

            while((str = bufferedReader.readLine()) != null) {

                line=str.split(" ");
                String a=line[0].toUpperCase()+" goes into " + line[1].toUpperCase() + " through "+ line[2];
                transitions.add(a);
                if(!alphabet.contains(line[2]))
                    alphabet.add(line[2]);

            }



        } catch (IOException e) {
            e.printStackTrace();
        }
        }

    public FA(List<String> states, HashSet<String> alphabet, List<String> transitions, String iState, List<String> fState) {
        this.states = states;
        this.alphabet = alphabet;
        this.transitions = transitions;
        this.iState = iState;
        this.fState = fState;
    }

    public List<String> getStates() {
        return states;
    }

    public void setStates(List<String> states) {
        this.states = states;
    }

    public HashSet<String> getAlphabet() {
        return alphabet;
    }

    public void setAlphabet(HashSet<String> alphabet) {
        this.alphabet = alphabet;
    }

    public List<String> getTransitions() {
        return transitions;
    }

    public void setTransitions(List<String> transitions) {
        this.transitions = transitions;
    }

    public String getiState() {
        return iState;
    }

    public void setiState(String iState) {
        this.iState = iState;
    }

    public List<String> getfState() {
        return fState;
    }

    public void setfState(List<String> fState) {
        this.fState = fState;
    }
}
