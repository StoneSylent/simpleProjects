/*
Author: Brandon Stone (.505)
Class: CSE 3521: AI 1
Project: #1 Problem solving by searching.
Due: Wed 9/23/2015
Part 2.
*/
package TickTackToeAI.part2;

public class Board  {
	
	//Used for directions.	
	public enum Action {
		LEFT(-1), RIGHT(1), UP(-3), DOWN(3), NONE(1000);
		
		private final int action;
		Action(int action) {	this.action = action; }
		public int value() { return action; }
	}
	//holds tile positions
	private int[] state = new int[] {}; 
	//the action used to get to this state.
	public Action action = Board.Action.NONE;
	//pathCost = depth + cost2go; //assigned by user.
	public int pathCost;
	//how far down the tree
	private int depth;
	//heuristic value assigned by user.
	public int cost2go; 
	//Used for tree structure.	
	public Board parent;
	public Board leftChild;
	public Board rightChild;
	public Board upChild;
	public Board downChild;
	
	//required by java;
	public Board() { }
	
	//defines the root node.
	public Board(int[] state)
	{
		this.state = state;
		this.depth = 0;
	}
	
	//attach state, parent, and update 
	public Board(Board parent)
	{
		this.state = parent.state.clone();
		this.parent = parent;
		this.depth = this.parent.depth + 1;	
	}
	//	
	public int[] getState()
	{
		return this.state.clone();
	}
	public void setState(int[] state)
	{
		this.state = state;
	}
	public int getDepth()
	{
		return this.depth;
	}
}
