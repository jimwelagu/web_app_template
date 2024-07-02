export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
};

export type Mutation = {
  __typename?: 'Mutation';
  addTask: Task;
};


export type MutationAddTaskArgs = {
  input: TaskInput;
};

export type Query = {
  __typename?: 'Query';
  getTasks: TaskConnection;
};


export type QueryGetTasksArgs = {
  limit?: InputMaybe<Scalars['Int']['input']>;
  nextToken?: InputMaybe<Scalars['String']['input']>;
};

export type Task = {
  __typename?: 'Task';
  createdAt: Scalars['String']['output'];
  id: Scalars['ID']['output'];
  owner: Scalars['ID']['output'];
  text: Scalars['String']['output'];
};

export type TaskConnection = {
  __typename?: 'TaskConnection';
  items?: Maybe<Array<Task>>;
  nextToken?: Maybe<Scalars['String']['output']>;
};

export type TaskInput = {
  text: Scalars['String']['input'];
};
