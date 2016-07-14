/*
Author: Brandon Stone (.505)
Class: CSE 3521: AI 1
Project: #1 Problem solving by searching.
Due: Wed 9/23/2015
Part 1.
*/

package TickTackToeAI.part1;

public class puzzleIDDFS extends Board {

	public static void main(String arg[])
	{
		//Create starting state and goal state
		//int[] initState = {1,0,2,3,4,5,6,7,8};
		int[] initState = {0,3,5,4,2,7,6,8,1};
		int[] goalState = {0,1,2,3,4,5,6,7,8};
		//Create Root node of tree.
		Board root = new Board(initState);
		//Do IDDFS search to solve the puzzle with an optimal solution. Also prints the result.
		boolean solnFound = IDDFS(root, goalState);
		if (!solnFound)
		{
			System.out.println("Max depth limit reached");
		}	
	}
	
	/*
	puzzleIDDFS implements the IDDFS technique to solve an 8-puzzle optimally. 
	The IDDFS searching technique depends on a recursive depth-limiting searching (dls) technique.
	When the dls fails to find a solution to the 8-puzzle the IDDFS increases the maxdepth available
	and dls is used again. Maximum depth is 20. returns false if no solution found. Returns true
	and prints out a solution if a solution is found. 
	*/	
	public static boolean IDDFS(Board root, int[] goalState)
	{
		//used to limit the depth of the search
		int depth = 0;
		while(true)
		{
			//limit the depth that the seach can go.
			Board newRoot = DLS(root, depth, goalState);
			
			if(newRoot != null)
			{
				Solution(newRoot);
				return true;
			}
			//not reached the max depth yet. 
			if (depth < 20)
			{
				//increase depth limit.		
				depth += 1;
			}
			else
			{
				return false;
			}
			
		}
	}
	
	//returns node if node.getState() == goalSate else returns null 
	private static Board DLS(Board root, int depth, int[] goalState)
	{
		//no more tree, solution found
		if (depth == 0 && Cost2Go(root.getState(), goalState) == 0) 
		{
			return root;
		} 
		//tree still left to travel, no solution found
		else if (depth > 0) 
		{
			/*
				The four if statements preceding this comment do not allow the new node to undo what
				their parent just did. This helps prevent subtrees from being duplicates of other
				subtrees, allowing the program to be slightly more efficient.	
			*/
			if (root.action != Board.Action.RIGHT) 
			{	root.leftChild  = childNode(root, Board.Action.LEFT);	}
			if (root.action != Board.Action.LEFT) 
			{ root.rightChild = childNode(root, Board.Action.RIGHT); }
			if (root.action != Board.Action.DOWN) 
			{	root.upChild 		= childNode(root, Board.Action.UP);	}
			if (root.action != Board.Action.UP) 
			{	root.downChild 	= childNode(root, Board.Action.DOWN); }
	
			Board[] children = new Board[]{ root.leftChild, root.rightChild, root.upChild,   root.downChild };
			//loop over new nodes.															  
			for (Board aChildren : children) {
				//check if action was possible
				if (aChildren != null) {
					//recursively limit depth
					root = DLS(aChildren, depth - 1, goalState);
					//soltuion found
					if (root != null) {
						return root;
					}
				}
			}		
		}
		return null;
	}

	/*
	Compares the give state with the goal state. The total number of misplaced
	tiles is returned. If the goalstate and given state not the same size the 
	return value is -1. A return value of zero identifies the two states
	as being the same.

	parameters:
		state 		-The 8-puzzle state to be checked.
		goalState -The 8-puzzle state that is the goal to achieve.	
	return:
		difference -the amount of tiles that do not match the goal configuration.
	*/
	public static int Cost2Go(int[] state, int[] goalState)
	{
		//Checks if the state and goalState are the same size.
		if (state.length != goalState.length)
		{
			return -1; //error data sets are not the same size!
		}
		
		int difference = 0;
		//loops over tiles to compare states.
		for (int i=0; i<state.length; i++)
		{
			if(state[i] != goalState[i])
			{
				//tile was out of position.
				difference += 1; 
			}
		}
		return difference;	
	}	 

	/*
	Recursively finds the path from the solution node to the initial node.
	This path is then printed out to the terminal as the optimal solution
	path. 
	 
	parameters:
		node -the node with a state matching the goal state.
	*/
	private static void Solution(Board node)
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
	
	/*
	Creates a new node following the action taken by moving the blank tile in the
	8-puzzle. If the blank could not be moved the function does not create a new node. 
	Returns the new node created or returns null if the action could not be taken. 

	parameters: 
		parent -the current board
		action -the action that the blank tile is requested to take	
	return:
		board -the board with a new state if the action was taken.
		null 	-the action could not be taken.
	
	*/
	private static Board childNode(Board parent, Action action)
	{
		//find the blank tile in the array
		int blankLocation = findIntElement(parent.getState());
		//calculate new postion of blank tile.
		int blanksNewPos = blankLocation+action.value();
		//check that tile can be moved in abounds of array.
		if(blanksNewPos < 0 || blanksNewPos > 8)
		{
			return null;
		}
		//check left boundary
		else if ( action==Board.Action.LEFT && (blankLocation==0 || blankLocation==3 || blankLocation==6) )
		{
			return null;
		}
		//check right boundary
		else if ( action==Board.Action.RIGHT && (blankLocation==2 || blankLocation==5 || blankLocation==8) )
		{
			return null;
		}
		else
		{
				//create child node
				Board child = new Board(parent);
				//move blank to new position.
				child.setState( tileSwap(child.getState(), blankLocation, blanksNewPos) );
				child.action = action;
				return child;
		}			
	}
	
	// returns i where array[i]==value else -1;
	private static int findIntElement(int[] array)
	{
		for(int i=0; i<array.length; i++)
		{
			if(array[i] == 0)
			{ return i; }
		}	
		return -1; //element not found.
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
	private static void prettyPuzzlePrint(Board node)
	{
		int[] puzzle = node.getState();
		System.out.println("Step "+node.getDepth()+":"+node.action);
		System.out.println("\n"+puzzle[0]+" "+puzzle[1]+" "+puzzle[2]);
		System.out.println("\n"+puzzle[3]+" "+puzzle[4]+" "+puzzle[5]);
		System.out.println("\n"+puzzle[6]+" "+puzzle[7]+" "+puzzle[8]);
	}
	
}

