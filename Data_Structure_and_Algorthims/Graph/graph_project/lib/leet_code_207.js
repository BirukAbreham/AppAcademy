// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/

// There are a total of numCourses courses you have to take, labeled from 0
// to numCourses - 1.
//
// Some courses may have prerequisites, for example to take course 0 you
// have to take course 1, which is expressed as a pair: [0, 1]
//
// Given the total number of courses and a list of prerequisite pairs, is it
// possible for you to finish all courses?
//
// Example 1:
// Input: numCourses = 2, prerequisites = [[1, 0]]
// Output: true
// - There are a total of 2 courses to take. To take course 1 you should have
//   finished course 0. So it is possible.
//
// Example 2:
// Input: numCourses = 2, prerequisites = [[1, 0], [0, 1]]
// Output: false
// - There are a total of 2 courses to take. To take course 1 you should have
//   finished course 0, and to take course 0 you should also have finished course
//   1. So it is impossible.
//

function buildGraph(list) {
  let graph = {};

  list.forEach((prereq) => {
    let [course, pre] = prereq.map(String);
    if (course in graph) {
      graph[course].push(pre);
    } else {
      graph[course] = [pre];
    }

    if (!(pre in graph)) {
      graph[pre] = [];
    }
  });

  return graph;
}

function canFinish(numCourses, prerequisites) {
  let prereq = buildGraph(prerequisites);
  let totalCourses = Object.keys(prereq).length;
  let completed = new Set();

  let eligiableCourseExists = true;

  while (eligiableCourseExists) {
    eligiableCourseExists = false;

    for (let course in prereq) {
      let everyPreBeenMet = prereq[course].every((pre) => completed.has(pre));
      if (!completed.has(course) && everyPreBeenMet) {
        completed.add(course);
        eligiableCourseExists = true;
      }
    }
  }

  return completed.size === totalCourses;
}

module.exports = {
  canFinish,
};
