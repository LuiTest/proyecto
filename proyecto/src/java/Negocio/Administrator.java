package Negocio;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Administrator {

    //MRB gestor = new MRB();  // esta es la instancia que me permitira accesar a los metodos de la clase MRB
    public Administrator() {
    }

    public String conectar() {
        String message = new String();
        try {
            administradorBD.getInstance().Connect();
        } catch (Exception exc) {
            message = exc.getMessage();
        }
        return message;
    } //posee el string de conexion con la base de datos

    public String desconectar() {
        String message = new String();
        try {
            administradorBD.getInstance().Disconnect();
        } catch (Exception exc) {
            message = exc.getMessage();
        }
        return message;
    } //cierra la conexion con la base de datos

    public boolean login(String username, String password) {
        boolean state = false;
        try {
           state = administradorBD.getInstance().login(username, password);
        } catch (Exception ex) {
            Logger.getLogger(Administrator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return state;
    }

    public String[][] desplegarMatriz() {
        String[][] matriz = null;
        try {
            matriz = administradorBD.getInstance().getResultSetData(administradorBD.getInstance().selectQuery(administradorBD.SELECT_STRING_MRB, null));
        } catch (Exception exc) {
            matriz = new String[1][1];
            matriz[0][0] = exc.getMessage();
        }
        return matriz;
    }// carga las lineas anteriormente almacenadas en la base de datos en base a un determinado departamento

    public void editarLinea(String[][] lineaEditada, int idLinea) {
        //gestor.UpdateLinea(lineaEditada, idLinea); //este metodo va a hacer un update de la linea en la base de datos mediante el id que le corresponde
    }

    public String[][] desplegarDefectos() {
        String[][] matriz = null;
        try {
            //obtiene el id y titulo (en ese orden) de la tabla defectos los cuales se encuentren entre el codigo 1 y 18.
            matriz = administradorBD.getInstance().getResultSetData(administradorBD.getInstance().selectQuery(administradorBD.SELECT_STRING_DEFECT, null));
        } catch (Exception exc) {
            matriz = new String[1][1];
            matriz[0][0] = exc.getMessage();
        }
        return matriz;
    }

    public String[][] desplegarModelos() {
        String[][] matriz = null;
        try {
            //obtiene el id y titulo (en ese orden) de la tabla defectos los cuales se encuentren entre el codigo 1 y 18.
            matriz = administradorBD.getInstance().getResultSetData(administradorBD.getInstance().selectQuery(administradorBD.SELECT_STRING_MODELS, null));
        } catch (Exception exc) {
            matriz = new String[1][1];
            matriz[0][0] = exc.getMessage();
        }
        return matriz;
    }

    public String desplegarPartesXDefecto() {
        String respuesta = "";
        try {
            //obtiene el id y titulo (en ese orden) de la tabla defectos los cuales se encuentren entre el codigo 1 y 18.
            String[][] matriz = null;
            Properties p_parameter = new Properties();
            p_parameter.put("DEFECT_ID", "");//aqui se pone el id de defecto. 3-15
            matriz = administradorBD.getInstance().getResultSetData(administradorBD.getInstance().selectQuery(administradorBD.SelECT_STRING_PARTXDEFECT, p_parameter));
            for (int index = 1; index < matriz.length; index++) {
                respuesta += matriz[index][0] + ",";
            }
            if (respuesta.length() > 0) {
                respuesta = respuesta.substring(0, respuesta.length() - 1);
            }
        } catch (Exception exc) {
            respuesta = exc.getMessage();
        }
        return respuesta;
    }

    public void eliminarLinea(int idLinea) {
        //gestor.DeleteLinea(idLinea); //este metodo va a eliminar el registro en la base de datos mediante el id que le corresponde
    }

    public int insertarLinea(String TagNumber, String DatePicker, String Shift, String NumberOperation, String LotNumber, String Quantity, String DollarsPerPiece,
            String Modelo, String WhoTagged, String DiscCode, String DatePicker2, String WhoDisposition, String DispositionCode, String NonConformingParts, String QtyScrapped, String DollarsScrapped) {

        try {
            String p_table = "MRB";
            Properties p_parameters = new Properties();

            //campos requeridos//

            p_parameters.put("DEPARTMENT_ID", "1"); //Departamento
            p_parameters.put("TAG_NUMBER", TagNumber); //digitado
            p_parameters.put("REVIEW_DATE", "2012-11-02"); //datepicker
            p_parameters.put("SHIFT", Shift); //values 1.2.3
            p_parameters.put("OPERATION_CODE", NumberOperation); //defect code
            p_parameters.put("LOT_NUMBER", LotNumber); // digitado
            p_parameters.put("QUANTITY", Quantity); //digitado
            p_parameters.put("COST_PER_PIECE", DollarsPerPiece); //digitado
            p_parameters.put("CURRENCY", "Dollar"); //Dolares
            p_parameters.put("MODEL_ID", Modelo);//Model ID
            p_parameters.put("WHO_TAGGED", WhoTagged); //personas, lo escogen los usuarios
            p_parameters.put("DISCREPANCY_CODE", DiscCode); // codigo de los defectos, eso se sacaria de la tabla defects.
            p_parameters.put("DISPOSITION_DATE", "2012-11-02"); //date picker
            p_parameters.put("WHO_DISPOSITION", WhoDisposition);  //Digitado
            p_parameters.put("DISPOSITION_CODE", DispositionCode); // A B C D E F
            p_parameters.put("NON_CONFORMING_PARTS", NonConformingParts); //digitado
            p_parameters.put("SCRAPPED_QUANTITY", QtyScrapped); //digitado
            p_parameters.put("TOTAL_SCRAPPED_COST", DollarsScrapped); //dolares scrapped
            p_parameters.put("SCRAPPED_PERCENT", "20"); //
            p_parameters.put("REGULATORY_COMPLIENCE", ""); //si no estan, pueden no incluirse
            p_parameters.put("DISCREPANCY_REPORT_NUMBER", ""); //si no estan, pueden no incluirse

            int rowId = administradorBD.getInstance().insertQuery(p_table, p_parameters);
            return rowId;
        } catch (Exception exc) {
            System.out.println("Excepcion: " + exc.getMessage());
        } finally {
            return -1;
        }
    }
}
