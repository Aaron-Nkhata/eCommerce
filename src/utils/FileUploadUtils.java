package utils;

import java.util.UUID;

public class FileUploadUtils {
	/**
     * get file name
     *
     * @param fileName
     * @return
     */
    public static String subFileName(String fileName) {
// get the position of the last \
        int index = fileName.lastIndexOf("\\");
        if (index == -1) {
            return fileName;
        }
        return fileName.substring(index + 1);
    }
    // generate UUID
    public static String generateRandonFileName(String fileName) {
// get extension name
        int index = fileName.lastIndexOf(".");
        if (index != -1) {
            String ext = fileName.substring(index);
            return UUID.randomUUID().toString() + ext;
        }
        return UUID.randomUUID().toString();
    }
    // get path name
    public static String generateRandomDir(String uuidFileName) {
        int hashCode = uuidFileName.hashCode();
// the root directory
        int d1 = hashCode & 0xf;
// get sub directory of root directory
        int d2 = (hashCode >> 4) & 0xf;
        return "/" + d1 + "/" + d2;
    }

}
