# changed the JUnit path from before
CPATH= '.:../lib/hamcrest-core-1.3.jar.:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

# $1 gets any github file link to clone it 
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -e 'ListExamples.java' ]];
then
    file='student-submission/ListExamples.java'
    echo 'valid java file'
    cd ..
    cp $file grading-area
    cp TestListExamples.java grading-area
    echo 'moved both files into the grading directory'
    cd grading-area

    # In order to check if it succeeds or not, we can try pasteing the output into another file
    #-cp means class path in order to compile with a outside library thats not in the directory
    # 2> any errors that come from the command 
    # 1> standard output
   javac -cp $CPATH TestListExamples.java ListExamples.java 2> output.txt
    # we are going to start making the if stuff


    echo 'fully compiled tests in the grading-area directory'




else
    echo 'didnt find the file'
fi






# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
