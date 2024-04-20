using Assets.Scripts;
using UnityEngine;

public class CharacterMoods : MonoBehaviour
{
    public CharacterName Name;

    public Sprite Angry;
    public Sprite Depressed;
    public Sprite Doubt;
    public Sprite Iddle;
    public Sprite Sad;
    public Sprite Shocked;
    public Sprite Sarcasm;
    public Sprite Smiling;
    public Sprite Unconfident;
    public Sprite Worried;

    public Sprite GetMoodSprite(CharacterMood mood)
    {
        switch (mood)
        {
            case CharacterMood.Iddle:
                return Iddle;
            case CharacterMood.Sad:
                return Sad ?? Iddle;
            case CharacterMood.Angry:
                return Angry ?? Iddle;
            case CharacterMood.Depressed:
                return Depressed ?? Iddle;
            case CharacterMood.Doubt:
                return Doubt ?? Iddle;
            case CharacterMood.Shocked:
                return Shocked ?? Iddle;
            case CharacterMood.Sarcasm:
                return Sarcasm ?? Iddle;
            case CharacterMood.Smiling:
                return Smiling ?? Iddle;
            case CharacterMood.Unconfident:
                return Unconfident ?? Iddle;
            case CharacterMood.Worried:
                return Worried ?? Iddle;
            default:
                Debug.Log($"Didn't find Sprite for character: {Name}, mood: {mood}");
                return Iddle;
        }
    }
}