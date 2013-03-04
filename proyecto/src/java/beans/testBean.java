package beans;
 
/**
 * Class <code>PersonBean</code>.
 */
public class testBean implements java.io.Serializable {
 
    private String name = null;
 
    private boolean deceased = false;
 
    /** No-arg constructor (takes no arguments). */
    public testBean() {
    }
 
    /**
     * Property <code>name</code> (note capitalization) readable/writable.
     */
    public String getName() {
        return name;
    }
 
    /**
     * Setter for property <code>name</code>.
     * @param NAME®
     */
    public void setName(final String NAME) {
        name = NAME;
    }
 
    /**
     * Getter for property "deceased"
     * Different syntax for a boolean field (is vs. get)
     */
    public boolean isDeceased() {
        return deceased;
    }
 
    /**
     * Setter for property <code>deceased</code>.
     * @param DECEASED
     */
    public void setDeceased(final boolean DECEASED) {
        deceased = DECEASED;
    }
}