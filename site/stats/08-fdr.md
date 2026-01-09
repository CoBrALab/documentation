# Multiple Comparisons

- What happens if I do many tests? Rate of false positives goes way up if adopting conventional significance threshold
- What's the usual solution to this? Bonferroni - just adjust threshold based on number of tests
- Why don't we do this? Usually analyzing tens of thousands of voxels/vertices - highest resolution possible, not imposing any predefined hypothesis on regions
- What do we do instead? FDR - more liberal, can expect results to include false positives
- Do nonsignificant effects "not exist"? Not necessarily - transparent visualization, contours for significance
