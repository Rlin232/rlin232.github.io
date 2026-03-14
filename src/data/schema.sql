-- Schema for Trip Restaurant Planner

-- Create the restaurants table
CREATE TABLE restaurants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users NOT NULL,
    name TEXT NOT NULL,
    google_maps_url TEXT,
    lat DOUBLE PRECISION NOT NULL,
    lng DOUBLE PRECISION NOT NULL,
    reservation_status TEXT CHECK (reservation_status IN ('Required', 'Recommended', 'Not Required', 'Walk-in Only')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Set up Row Level Security (RLS)
ALTER TABLE restaurants ENABLE ROW LEVEL SECURITY;

-- Create policies
-- Users can only see their own restaurants
CREATE POLICY "Users can view their own restaurants."
    ON restaurants FOR SELECT
    USING (auth.uid() = user_id);

-- Users can insert their own restaurants
CREATE POLICY "Users can insert their own restaurants."
    ON restaurants FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Users can update their own restaurants
CREATE POLICY "Users can update their own restaurants."
    ON restaurants FOR UPDATE
    USING (auth.uid() = user_id);

-- Users can delete their own restaurants
CREATE POLICY "Users can delete their own restaurants."
    ON restaurants FOR DELETE
    USING (auth.uid() = user_id);
