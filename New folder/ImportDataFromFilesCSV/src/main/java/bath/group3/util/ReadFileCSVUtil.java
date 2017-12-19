package bath.group3.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ReadFileCSVUtil {
	public static ArrayList<String[]> readFilesCSV(String path){
		ArrayList<String[]> dsa = new ArrayList<String[]>();
		BufferedReader br=null;
		try {
			br = new BufferedReader(new FileReader(path));
			String line;
			while((line = br.readLine()) !=null){
				String[] b = line.split(",");
	            dsa.add(b);
	        }
			return dsa;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		} 
        finally {
        	try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        return null;
	}
}
