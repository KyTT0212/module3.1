import java.util.Random;
import java.util.Scanner;

public class Main {
    private static Random input;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        do {
            System.out.print("Nhập một số nguyên chẵn: ");
            n = input.nextInt();
        } while (n % 2 != 0);
        n = Integer.parseInt(sc.nextLine());

//        int n;
//        do {
//            System.out.print("input n");
//            Scanner input = null;
//            while (!input.hasNextInt()) {
//                System.out.println(" Vui lòng nhập lại!");
//                input.next();
//            }
//            n = input.nextInt();
//        } while (n % 2 != 0) ;
//            n = Integer.parseInt(sc.nextLine());

        int k = 0;
        for (int i = n / 2; i >= 1; --i) {
            for (int j = 1; j <= n / 2 - i; ++j) {
                System.out.print("  ");
            }
            for (int j = i; j <= 2 * i; ++j) {
                System.out.print("* ");
            }
            for (int j = 0; j < i - 1; ++j) {
                System.out.print("* ");
            }
            System.out.println();
        }
        for (int i = 1; i <= n / 2; ++i, k = 0) {
            for (int j = 1; j <= n / 2 - i; ++j) {
                System.out.print("  ");
            }
            while (k != 2 * i) {
        System.out.print("* ");
        k++;

        }
        System.out.println();
        }

    }

}


