
package rules_checkstyle;

import java.io.IOException;
import java.security.Permission;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Arrays;
import java.util.List;

public final class Main {
    @SuppressWarnings("removal")
    private static class BlockExistSecurityManager extends SecurityManager {
        private int exitCode = Integer.MAX_VALUE;

        @Override
        public void checkExit(int status) {
            exitCode = status;
            throw new SecurityException();
        }

        @Override
        public void checkPermission(Permission perm) {
        }
    }

    @SuppressWarnings("removal")
    public static void main(String[] args) throws IOException {
        List<String> arguments = Arrays.asList(args);

        boolean failed = false;

        BlockExistSecurityManager secManager = new BlockExistSecurityManager();
        System.setSecurityManager(secManager);

        try {
            com.puppycrawl.tools.checkstyle.Main.main(args);
        } catch (SecurityException e) {
            failed = secManager.exitCode != 0;
        } catch (IOException ex) {
            throw ex;
        }

        if (failed) {
            String outputFile = argument(arguments, "-o");
            printFile(outputFile);
            System.setSecurityManager(null);
            System.exit(-1);
        }
    }

    private static String argument(List<String> arguments, String name) {
        try {
            return arguments.get(arguments.indexOf(name) + 1);
        } catch (IndexOutOfBoundsException ignored) {
            return null;
        }
    }

    private static void printFile(String filePath) {
        try (BufferedReader fileReader = new BufferedReader(new FileReader(filePath))) {
            fileReader.lines().forEach(System.err::println);
        } catch (IOException ignored) {
        }
    }
}
