/*
Author: Brandon Stone (.505)
Class: CSE 3521: AI 1
Project: #1 Problem solving by searching.
Due: Wed 9/23/2015
Part 2.
*/
package TickTackToeAI.part2;

import java.util.*;


public class puzzleAStar extends Board {

	public static void main(String arg[])
	{
		//Create starting state and goal state
		int[] initState = {0,3,5,4,2,7,6,8,1};
		int[] goalState = {0,1,2,3,4,5,6,7,8};
		//Create Root node of tree.
		Board root = new Board(initState);
		//Assign heuristic value
		root.cost2go = Cost2Go(root.getState(), goalState);
		root.pathCost = root.cost2go; //depth=0
		//Do A* search to solve the puzzle with an optimal solution. Also prints the result.
		AStarSearch(root, goalState);
		
	}
	
	//finds the optimal path for solving the 8puzzle
	//prints the solution to the terminal then stops.
	public static void AStarSearch(Board root, int[] goalState)
	{
		//Holds the frontier list of nodes. 
		PriorityQueue<Board> queue = new PriorityQueue<Board>(150, new Comparator<Board>() {
			//allows the smallest pathcost to be pulled from the PriorityQueue.
			public int compare(Board n1, Board n2)
			{
				Integer n1cost = n1.pathCost;
				Integer n2cost = n2.pathCost;
				return n1cost.compareTo(n2cost);
			}
		});
		
		//smallest node in the tree.
		Board smallestNode = root;
		//add root to frontier
		queue.add(root);
	
		//check smallest node to see if it is the same as the goalState
		while(smallestNode.cost2go > 0)
		{
			/*
				The four 'if' statements after this comment do not allow the new node to undo what
				their parent just did. This helps prevent subtrees from being duplicates of other
				subtrees, allowing the program to be slightly more efficient.	
			*/
			if (smallestNode.action != Board.Action.RIGHT) 
			{	smallestNode.leftChild  = childNode(smallestNode, Board.Action.LEFT, goalState); }
			
			if (smallestNode.action != Board.Action.LEFT) 
			{	smallestNode.rightChild = childNode(smallestNode, Board.Action.RIGHT, goalState); }
			
			if (smallestNode.action != Board.Action.DOWN) 
			{	smallestNode.upChild = childNode(smallestNode, Board.Action.UP, goalState); }
			
			if (smallestNode.action != Board.Action.UP) 
			{	smallestNode.downChild 	= childNode(smallestNode, Board.Action.DOWN, goalState); }
			
			//add children to array for easier use. 	
			Board[] children = new Board[]{ smallestNode.leftChild, smallestNode.rightChild, smallestNode.upChild,   smallestNode.downChild };
			
			//loop over the four children and add them to the frontier.
			for (int i=0; i<children.length; i++)
			{		
				//if action was possible with blank location.
				if (children[i] != null)
				{ 	
					queue.add(children[i]); 
				}
			}
			//get the smallest value for A* search from frontier
			smallestNode = queue.poll();
		}	
			//Find solution sequence and print it.
			Solution(smallestNode);
			//clear the queue as it is not useful.
			queue.clear();
	}
	
	/* 
		recursively backtracks through tree to print solution.
	*/
	public static void Solution(Board node)
	{
		if(node.parent != null)
		{
			Solution(node.parent);
			prettyPuzzlePrint(node);	
		}
		else
		{
			prettyPuzzlePrint(node);
		}
	}
	
	/*Changes the 8puzzle based on the action.
		requires: parent.puzzle != null.
		ensures action is taken else returns null node.
		
	*/
	public static Board childNode(Board parent, Action action, int[] goalState)
	{
		//find the blank tile in the array
		int blankLocation = findIntElement(parent.getState(), 0);
		//calculate new position of blank tile.
		int blanksNewPos = blankLocation+action.value();
		//check that tile can be moved in abounds of array.
		if(blanksNewPos < 0 || blanksNewPos > 8)
		{
			return null;
		}
		//check left boundary
		else if ( action == Board.Action.LEFT && (blankLocation == 0 || blankLocation == 3 || blankLocation == 6) )
		{
			return null;
		}
		//check right boundary
		else if ( action == Board.Action.RIGHT && (blankLocation == 2 || blankLocation == 5 || blankLocation == 8) )
		{
			return null;
		}
		else
		{
				//create child node
				Board child = new Board(parent);
				//move blank to new position.
				child.setState( tileSwap(child.getState(), blankLocation, blanksNewPos) );
				//update child values
				child.cost2go = Cost2Go(child.getState(), goalState);
				child.pathCost = child.cost2go + child.getDepth();
				child.action = action;
				return child;
		}			
	}
	
	// returns i of array[i]==value else -1;
	private static int findIntElement(int[] array, int value)
	{
		for(int i=0; i<array.length; i++)
		{
			if(array[i] == value)
			{ return i; }
		}	
		return -1; //element not found.
	}
	
	/*	Checks how many tiles the current state has out of place.
			returns int, -1 if states are not the same size. 
	*/
	public static int Cost2Go(int[] state, int[] goalState)
	{
		//Checks if the state and goalState are the same size.
		if (state.length != goalState.length)
		{
			return -1; //error data sets are not the same size!
		}
		
		int heuristicValue = 0;
		//loops over tiles to compare states.
		for (int i=0; i<state.length; i++)
		{
			if(state[i] != goalState[i])
			{
				//tile was out of position.
				heuristicValue += 1; 
			}
		}
		return heuristicValue;	
	}
	
	/*
		requires: pos1 & pos2 to be in bounds of state array.
		ensures:  values at state[pos1] and state[pos2] are swapped.
	*/
	public static int[] tileSwap(int[] state, int pos1, int pos2)
	{
		int temp = state[pos1];
		state[pos1] = state[pos2];
		state[pos2] = temp;
		return state;
	}
	
	//prints the puzzle in a visual layout
	//requires: node != null
	public static void prettyPuzzlePrint(Board node)
	{
		int[] puzzle = node.getState();
		System.out.println("Step "+node.getDepth()+":"+node.action);
		System.out.println("\n"+puzzle[0]+" "+puzzle[1]+" "+puzzle[2]);
		System.out.println("\n"+puzzle[3]+" "+puzzle[4]+" "+puzzle[5]);
		System.out.println("\n"+puzzle[6]+" "+puzzle[7]+" "+puzzle[8]);
	}
	
}

