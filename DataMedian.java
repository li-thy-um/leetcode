/*
* @Author George Huang
*/
public class DataMedian {

  public static void main(String[] args) {
    //Assume no values eq
    int[] mm = new int[6];
    mm[0] = 1;
    mm[1] = 2;
    mm[2] = 3 ;
    mm[3] = 4;
    mm[4] = 6;
    mm[5] = 9;

    int[] nn = new int[6];
    nn[0] = 55;
    nn[1] = 56;
    nn[2] = 8921;
    nn[3] = 9623;
    nn[4] = 10000;
    nn[5] = 10003;

    if (mm.length <= nn.length)
    System.out.println(findMedian(mm, nn, 0, mm.length - 1, 0, nn.length - 1));
    else System.out.println(findMedian(nn, mm, 0, nn.length - 1, 0, mm.length - 1));
  }

  private static double findMedian(int[] mm, int[] nn, int i, int j, int k,
  int l) {
    if (i < 0 || j < 0 || i > j || k < 0 || l < 0 || k > l || mm.length <= j || nn.length <= l){
      return -9999;
    }
    int sLen = j - i + 1;
    int lLen = l - k + 1;
    int minLen;

    if ((sLen + lLen)%2 == 0) {
      minLen = 2;
    } else {
      minLen = 1;
    }

    if (sLen <= minLen) {
      return findMedianDirectly(mm, nn, i, j, k, l);
    }
    else if (findMedianOfOneArray(mm, i, j) == findMedianOfOneArray(nn, k, l)) {
      return findMedianOfOneArray(mm, i, j);
    }

    if (sLen%2 == 0 ){
      if (lLen%2 ==0) {
        if (mm[(i + j)/2] <  findMedianInTwo(nn[(k+l - 1)/2], nn[(k+l+1)/2])){
          //prune m/2 -1
          return findMedian(mm, nn, i + sLen/2 -1, j, k, l - sLen/2 + 1);
        }
        else return findMedian(mm, nn, i, j - sLen/2 + 1 , k + sLen/2 - 1, l);
      }

      else {
        if (mm[(i + j)/2] < nn[(k+l)/2]){
          //prune m/2
          return findMedian(mm, nn, i + sLen/2 , j, k, l - sLen/2 );
        }
        else return findMedian(mm, nn, i, j - sLen/2  , k + sLen/2, l);
      }

    }
    else {
      if (lLen%2 ==0) {
        if (mm[(i + j)/2] < findMedianInTwo(nn[(k+l - 1)/2], nn[(k+l+1)/2])){
          //prune (m-1)/2
          return findMedian(mm, nn, i + (sLen -1)/2 , j, k, l - (sLen-1)/2 );
        }
        else return findMedian(mm, nn, i, j - (sLen-1)/2  , k + (sLen-1)/2, l);
      }

      else {
        if (mm[(i + j)/2] < nn[(k+l)/2]){
          //prune (m-1)/2
          return findMedian(mm, nn, i + (sLen -1)/2 , j, k, l - (sLen-1)/2 );
        }
        else return findMedian(mm, nn, i, j - (sLen-1)/2  , k + (sLen-1)/2, l);
      }

    }

  }

  private static double findMedianOfOneArray(int[] mm, int i, int j) {
    if ( (i + j) % 2 == 0){
      return mm[(i+j)/2];
    }
    else return (mm[ (i+j-1)/2] + mm[(i+j+1)/2])/2;
  }

  private static double findMedianDirectly(int[] mm, int[] nn, int i, int j,
  int k, int l) {
    // 1 and 2k
    if (i == j && (l - k + 1)%2 == 0){
      return findMedianInThree(mm[i], nn[(l + k - 1)/2], nn[(l + k + 1)/2]);
    }
    // 1 and 2k-1
    else if (i == j && (l - k + 1)%2 != 0) {
      int index = (l + k)/2;
      if (l == k) return findMedianInTwo(mm[i], nn[index]);
      return findMedianInFour(mm[i], nn[index - 1], nn[index], nn[index + 1]);
    }

    // 2 and 2k
    else if  (i != j && (l - k + 1)%2 == 0) {
      return findMedianInFourBalanced(mm[i], mm[j], nn[(l + k - 1)/2], nn[(l + k + 1)/2]);
    }

    else return -9999;
  }

  private static double findMedianInFourBalanced(int i, int j, int k, int l) {
    if (i > l)
    return findMedianInTwo(i, l);
    else if (i < k)
    return findMedianInTwo(j, k);
    else {
      if (j < l)
      return findMedianInTwo(i, j);
      else return findMedianInTwo(i,l);

    }
  }

  private static double findMedianInFour(int i, int j, int k, int l) {
    if (i < j)
    return findMedianInTwo(j, k);
    else if (i > l)
    return findMedianInTwo(k, l);
    else {
      return findMedianInTwo(i, k);
    }
  }

  private static double findMedianInTwo(int i, int j) {
    double result = (i + j)/2.0;
    return result;
  }

  private static double findMedianInThree(int i, int j, int k) {
    if (inMiddlePlace(i, j, k) )
    return i;
    else if(inMiddlePlace(j, i, k))
    return j;
    else if (inMiddlePlace(k, i ,j))

    return k;
    else return -9999;
  }

  private static boolean inMiddlePlace(int i, int j, int k) {
    return ((i - j) * (i - k)) < 0? true: false;
  }

}
