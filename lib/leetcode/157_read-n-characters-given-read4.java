public class Solution extends Reader4 {
    public int read(char[] buf, int n) {
        char[] sbuf = new char[4];
        int i=0;
        while(i<n) { // Keep reading
            int rc = read4(sbuf);
            if(rc == 0) break;
            for(int j=0; j<rc && i<n; j++,i++) {
                System.out.println("i:" + i + " j:" + j);
                buf[i] = sbuf[j];
            }
        }
        System.out.println("---i:" + i);
        return i;
    }
}
